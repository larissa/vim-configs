((comment) @_start @_end
     (#make-range! "range" @_start @_end))

; TODO This query doesn't work for comment groups at the start and end of a
; file
; See https://github.com/tree-sitter/tree-sitter/issues/1138
(((_) @head . (comment) @_start . (comment)+ @_end (_) @tail)
    (#not-kind-eq? @tail "comment")
    (#not-kind-eq? @head "comment")
    (#make-range! "range" @_start @_end))

(([
    (method)
    (singleton_method)
    (method_parameters)
    (body_statement)
    (call)
    (module)
    (class)
    (singleton_class)
    (block)
    (block_body)
    (block_parameters)
    (do_block)
    (if)
    (binary)
    (then)
    (else)
    (unless)
    (for)
    (until)
    (while)
    (argument_list)
] @_start @_end)
(#make-range! "range" @_start @_end))

; sorbet type *annotation*
(((call method: (identifier) @_start) . (method) @_end)
    (#match? @_start "sig")
    (#make-range! "range" @_start @_end))

((return (_) @_start @_end)
    (#make-range! "range" @_start @_end))
