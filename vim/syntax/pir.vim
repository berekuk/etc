" Vim syntax file
" Language:	Parrot IMCC
" Maintainer:	Luke Palmer <fibonaci@babylonia.flatirons.org>
" Modified: Joshua Isom
" Last Change:	Jan 6 2006

" For installation please read:
" :he filetypes
" :he syntax
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax clear

syn include @Pod syntax/pod.vim
syn region pirPod start="^=[a-z]" end="^=cut" keepend contains=@Pod fold

syn keyword pirType int float num string pmc
syn match   pirPMC  /\.\(Compiler\|Continuation\|Coroutine\|CSub\|NCI\|Eval\|Sub\|Scratchpad\)/
syn match   pirPMC  /\.\(BigInt\|Boolean\|Complex\|Float\|Integer\|PMC\|String\|Hash\)/
syn match   pirPMC  /\.\(Fixed\|Resizable\)\(Boolean\|Float\|Integer\|PMC\|String\)Array/
syn match   pirPMC  /\.\(IntList\|Iterator\|Key\|ManagedStruct\|UnManagedStruct\|Pointer\)/
syn match   pirPMC  /\.\(FloatVal\|Multi\|S\|String\)\?Array/
syn match   pirPMC  /\.Perl\(Array\|Env\|Hash\|Int\|Num\|Scalar\|String\|Undef\)/
syn match   pirPMC  /\.Parrot\(Class\|Interpreter\|IO\|Library\|Object\|Thread\)/
syn keyword pirPMC self

syn keyword pirOp   goto if unless global addr

syn match pirDirectiveSub    /\.\(sub\|end\s*$\)/
syn match pirDirectiveMacro  /\.\(macro\|endm\)/
syn match pirDirective  /\.\(pcc_sub\|emit\|eom\)/
syn match pirDirective  /\.\(local\|sym\|const\|lex\|global\|globalconst\)/
syn match pirDirective  /\.\(endnamespace\|namespace\)/
syn match pirDirective  /\.\(param\|arg\|return\|yield\)/
syn match pirDirective  /\.\(pragma\|HLL\|include\|loadlib\)/
syn match pirDirective  /\.\(pcc_begin\|pcc_call\|pcc_end\|invocant\|meth_call\|nci_call\)/
syn match pirDirective  /\.\(pcc_begin_return\|pcc_end_return\)/
syn match pirDirective  /\.\(pcc_begin_yield\|pcc_end_yield\)/

syn match pirDirective  /:\(main\|method\|load\|init\|anon\|multi\|immediate\|outer\|lex\|vtable|nsentry\|subid\)/
syn match pirDirective  /:\(flat\|slurpy\|optional\|opt_flag\|named\)/

" Macro invocation
syn match pirDirective  /\.\I\i*(/he=e-1


" pirWord before pirRegister
" FIXME :: in identifiers and labels
syn match pirWord           /[A-Za-z_][A-Za-z0-9_]*/
syn match pirComment        /#.*/
syn match pirLabel          /[A-Za-z0-9_]\+:/he=e-1
syn match pirRegister       /[INPS]\([12][0-9]\|3[01]\|[0-9]\)/
syn match pirDollarRegister /\$[INPS][0-9]\+/

syn match pirNumber         /[+-]\?[0-9]\+\(\.[0-9]*\([Ee][+-]\?[0-9]\+\)\?\)\?/
syn match pirNumber         /0[xX][0-9a-fA-F]\+/
syn match pirNumber         /0[oO][0-7]\+/
syn match pirNumber         /0[bB][01]\+/

syn region pirString start=/"/ skip=/\\"/ end=/"/ contains=pirStringSpecial
syn region pirString start=/<<"\z(\I\i*\)"/ end=/^\z1$/ contains=pirStringSpecial
syn region pirString start=/<<'\z(\I\i*\)'/ end=/^\z1$/
syn region pirString start=/'/ end=/'/
syn match  pirStringSpecial "\\\([abtnvfre\\"]\|\o\{1,3\}\|x{\x\{1,8\}}\|x\x\{1,2\}\|u\x\{4\}\|U\x\{8\}\|c[A-Z]\)" contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_pasm_syntax_inits")
  if version < 508
    let did_pasm_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pirPod             Comment
  HiLink pirWord            Normal
  HiLink pirComment         Comment
  HiLink pirLabel           Label
  HiLink pirRegister        Identifier
  HiLink pirDollarRegister  Identifier
  HiLink pirType            Type
  HiLink pirPMC             Type
  HiLink pirString          String
  HiLink pirStringSpecial   Special
  HiLink pirNumber          Number
  HiLink pirDirective       Macro
  HiLink pirDirectiveSub    Macro
  HiLink pirDirectiveMacro  Macro
  HiLink pirOp              Conditional

  delcommand HiLink
endif

let b:current_syntax = "pir"

" Folding rules
syn region foldManual  start=/^\s*#.*{{{/ end=/^\s*#.*}}}/ contains=ALL keepend fold
syn region foldMakro   start=/\.macro/ end=/^\s*\.endm/ contains=ALLBUT,pirDirectiveMacro keepend fold
syn region foldSub     start=/\.sub/ end=/^\s*\.end/ contains=ALLBUT,pirDirectiveSub,pirDirectiveMacro keepend fold
syn region foldIf      start=/^\s*if.*goto\s*\z(\I\i*\)\s*$/ end=/^\s*\z1:\s*$/ contains=ALLBUT,pirDirectiveSub,pirDirectiveMacro keepend fold
syn region foldUnless  start=/^\s*unless.*goto\s*\z(\I\i*\)\s*$/ end=/^\s*\z1:\s*$/ contains=ALLBUT,pirDirectiveSub,pirDirectiveMacro keepend fold

" Ops -- dynamically generated from ops2vim.pl
syn keyword pirOp band bor shl shr lsr bxor eq eq_str eq_num eq_addr ne
syn keyword pirOp ne_str ne_num ne_addr lt lt_str lt_num le le_str le_num
syn keyword pirOp gt gt_str gt_num ge ge_str ge_num if_null unless_null
syn keyword pirOp cmp cmp_str cmp_num cmp_pmc issame isntsame istrue
syn keyword pirOp isfalse isnull isgt isge isle islt iseq isne and not or
syn keyword pirOp xor end noop check_events check_events__ wrapper__
syn keyword pirOp load_bytecode load_language branch local_branch
syn keyword pirOp local_return jump enternative if unless invokecc invoke
syn keyword pirOp yield tailcall returncc capture_lex newclosure set_args
syn keyword pirOp get_params set_returns get_results set_result_info
syn keyword pirOp result_info set_addr get_addr schedule addhandler
syn keyword pirOp push_eh pop_eh throw rethrow count_eh die exit debug
syn keyword pirOp bounds profile trace gc_debug interpinfo warningson
syn keyword pirOp warningsoff errorson errorsoff runinterp getinterp
syn keyword pirOp sweep collect sweepoff sweepon collectoff collecton
syn keyword pirOp needs_destroy loadlib dlfunc dlvar compreg new_callback
syn keyword pirOp annotations trap set_label get_label fetch vivify new
syn keyword pirOp root_new find_codepoint finalize print say getstdin
syn keyword pirOp getstdout getstderr abs add dec div fdiv ceil floor inc
syn keyword pirOp mod mul neg sub sqrt callmethodcc callmethod
syn keyword pirOp tailcallmethod addmethod can does isa newclass subclass
syn keyword pirOp get_class class addparent removeparent addrole
syn keyword pirOp addattribute removeattribute getattribute setattribute
syn keyword pirOp inspect typeof get_repr find_method defined exists
syn keyword pirOp delete elements push pop unshift shift splice setprop
syn keyword pirOp getprop delprop prophash freeze thaw add_multi
syn keyword pirOp find_multi register unregister box iter morph clone set
syn keyword pirOp assign setref deref copy null ord chr chopn concat
syn keyword pirOp repeat length bytelength pin unpin substr replace index
syn keyword pirOp sprintf stringinfo upcase downcase titlecase join split
syn keyword pirOp charset charsetname find_charset trans_charset encoding
syn keyword pirOp encodingname find_encoding trans_encoding is_cclass
syn keyword pirOp find_cclass find_not_cclass escape compose spawnw err
syn keyword pirOp time sleep store_lex store_dynamic_lex find_lex
syn keyword pirOp find_dynamic_lex find_caller_lex get_namespace
syn keyword pirOp get_hll_namespace get_root_namespace get_global
syn keyword pirOp get_hll_global get_root_global set_global
syn keyword pirOp set_hll_global set_root_global find_name
syn keyword pirOp find_sub_not_null
