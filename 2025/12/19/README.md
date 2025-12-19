# 2025/12/19 Random Ideas

## Human Learning in the Age of Machine Learning

## Literate Programming with Python Modules and Packages

## Markdown as I/O Format

## Probalistic and Heuristic Learning

## Branching and Immutability

## Layers, Stacks and Graphs

## MathJaX

This is math in $$\LaTeX$$: $$x+1\over x-1$$

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$


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

