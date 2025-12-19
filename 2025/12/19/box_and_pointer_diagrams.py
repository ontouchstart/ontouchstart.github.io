def box_and_pointer_diagrams():
    return r"""### Box and Pointer Diagram

[https://codereview.meta.stackexchange.com/questions/1828/how-do-i-draw-box-and-pointer-diagrams/1829](https://codereview.meta.stackexchange.com/questions/1828/how-do-i-draw-box-and-pointer-diagrams/1829#1829)

$$
\newcommand{ptr}[1]{\overset{\mathtt{#1}}{\longrightarrow}}
\begin{align*}
                                             &\mathtt{newNode} \\
                                             &\quad\downarrow  \\
\mathtt{head} \ptr{} \fbox{first} \ptr{next} &\fbox{another} \ptr{next} \mathtt{null} \\
                                             &\fbox{second}  \ptr{next}
                                              \fbox{rest}    \ptr{next}
                                              \fbox{of}      \ptr{next}
                                              \fbox{list}    \ptr{next} \mathtt{null}
\end{align*}
$$
"""
