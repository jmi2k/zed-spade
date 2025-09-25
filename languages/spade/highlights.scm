; taken from https://gitlab.com/spade-lang/spade-vim/-/blob/1016b4eafabaa75728569b1ba1bfbf8a849a4ec4/queries/spade/highlights.scm
; Licensed under the MIT License:
;
; Copyright 2022 Spade contributors
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of
; this software and associated documentation files (the "Software"), to deal in
; the Software without restriction, including without limitation the rights to
; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
; of the Software, and to permit persons to whom the Software is furnished to do
; so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

((identifier) @type
  (#lua-match? @type "[A-Z]"))

((identifier) @constant
 (#lua-match? @constant "^[A-Z][A-Z%d_]*$"))

(self) @variable.builtin

(unit_definition (identifier) @function)

(parameter (identifier) @variable.parameter)

((pipeline_reg_marker) @keyword)

(scoped_identifier
  path: (identifier) @module)
(scoped_identifier
 (scoped_identifier
  name: (identifier) @module))
((scoped_identifier
    name: (identifier) @type)
 (#lua-match? @type "^[A-Z]"))

((builtin_type) @type.builtin)

((identifier) @type.builtin
 (#any-of?
    @type.builtin
    "uint"
    "Option"
    "Memory"))

((identifier) @constant.builtin
 (#any-of? @constant.builtin "Some" "None"))

((pipeline_stage_name) @label)

((stage_reference
    stage: (identifier) @label))

[
    "pipeline"
    "let"
    "set"
    "entity"
    "fn"
    "reg"
    "reset"
    "inst"
    "assert"
    "struct"
    "enum"
    "stage"
    "impl"
    "port"
    "decl"
    "mod"
] @keyword

[
 "use"
] @keyword.import

[
 "gen"
] @keyword.directive

((gen_if_expression ["if" "else"] @preproc))
((naked_gen_if_expression ["if" "else"] @preproc))

;((attribute
;  "#" @punctuation.special
;  "[" @punctuation.bracket
;  (identifier) @function.macro
;  "(" @punctuation.bracket
;  (attribute_argument) @variable
;  (attribute_argument "=") @operator
;  ("," @punctuation.delimiter)
;  ")" @punctuation.bracket
;  "]" @punctuation.bracket
;))

((attribute
   "#" @punctuation.special
   "[" @punctuation.bracket
    ( identifier ) @variable @function.macro
    "(" @punctuation.bracket
    ((attribute_argument
        (identifier) @variable
    ))
    ;"," @punctuation.delimiter
   ")" @punctuation.bracket
   "]" @punctuation.bracket
))

[
  "else"
  "if"
  "match"
] @conditional

(bool_literal) @boolean
(int_literal) @number

[
  "&"
  "inv"
  "-"
  "=>"
  ">"
  "<"
  "="
  "->"
  "~"
  "!"
] @operator


((op_add) @operator)
((op_sub) @operator)
((op_mul) @operator)
((op_equals) @operator)
((op_lt) @operator)
((op_gt) @operator)
((op_le) @operator)
((op_ge) @operator)
((op_lshift) @operator)
((op_rshift) @operator)
((op_bitwise_and) @operator)
((op_bitwise_xor) @operator)
((op_bitwise_or) @operator)
((op_logical_and) @operator)
((op_logical_or) @operator)


[
  (line_comment)
  (doc_comment)
  (block_comment)
] @comment @spell
