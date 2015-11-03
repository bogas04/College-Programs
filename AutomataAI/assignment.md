In order to understand decidability and undecidability, we need to go through Turing Machines.

Turing Machine
==
A Turing Machine is a 7 tuple M = (Q, ∏, b, ∑, ∂, q0, F)
Where
Q : finite non empty set of states
∏ : finte non empty set of tape alphabets
b : blank symbol belonging to ∏
∑ : ∏\{b}, all input alphabets apart from b in ∏
∂ : (Q \ F) x ∏ -> Q x ∏ x {L, R}, transition function mapping current state and tape alphabet to
    next state, replacement for current tape alphabet and direction of movement of read/write head over the alphabet tape.
q0: inital state
F : set of finial states

A Turing Machine can be implemented as hardware to solve given problem. In fact, a Turing Machine can represent real computers.
Hence if we can create a computer program for a problem, equivalent Turing Machine can be created.
There can be two types of Turing Machines:
  1) Machines that halt no matter they accept or reject given input.
  2) Machines that run forever in case of inputs they don't accept.

The problem with latter machines is that we can never know when the Machine isn't accepting the input, as the running time isn't
known for a problem.

Decision Problems
==
A decision problem is a function that associates with each input instance of the problem a truth value: true or false.

Decision Algorithm
==
A decision algorithm is an algorithm to correctly associate an input with its truth value as per the decision problem specification.
If an algorithm can be written for a decision problem, a corresponding computer program can also be made for it.
This is true because an algorithm is truly a language which can be accepted by a machine to perform mentioned tasks,
just like instructions written in a computer program. These denote the first type of Turing Machines, ones which halt.


Decidability
==
A problem is called decidable if an algorithm or a computer program can be given that can correctly answer the problem for
all given instances of the problem.

On the other hand, if we can't compute(write algorithm/computer program) correct answer for all
instances of the problem, we call it undecidable.

P Problems
==
Before we understand what NP is we first need to learn about polynomial time solutions.
A Turing Machine M is said to be of time complexity T(n) if whenever M is given an input of length n, M halts after making at most T(n) move,
regardless of whether M accepts or rejects the input. This applies to any function T(n), however a polynomial time solution is
one in which T(n) is a polynomial in n. 
For example:
  T(n) = n^3 + 5n^2

Non-deterministic Polynomial Time
==
NP problems are those that can be solved by a nondeterministic Turing Machine in polynomial time. In other words, we say that
a program/language L is in NP class if there is a nondeterministic Turing Machine M and a polynomial time complexity T(n),
such that L = L (M), and when M is given an input of length n, there are no sequences of more than T(n) moves of M.

A Problem is in NP iff it is decidable by some non deterministic Turing machine in polynomial time.

Since all deterministic Turing Machines are non-deterministic Turing Machines, all P problems are also NP problems.
However, not all NP problems can be solved using deterministic Turing Machines in polynomial time.
An example of NP problem is Traveling Salesman. 
 
Reducibility
==
A problem Q can be reduced to another problem Q’ if any instance of Q can be “easily rephrased” as an instance of Q’,
the solution to which provides a solution to the instance of Q

NP-Hard Problems
==
A problem (a language) is said to NP-hard if every problem in NP can be poly time reduced to it. However we can't prove that L is in NP class.

NP Complete Problems
==
Let L be a language/problem in NP. We say that L is NP-complete if:
  1) L is in NP
  2) For every language L' in NP, there is a polynomial-time reduction of L' to L.
So in other words, NP complete problems are ones which are NP-hard and in NP class of problems.

An interesting case
==
If say we find a problem L such that it is NP complete and in P, then all problems in NP could be reduced to L, and hence every NP problem would then be in P.

An example of NP-complete problem is SAT problem, i.e. given a boolean expression, is it satisfiable ? 
A boolean expression is said to be satisfiable if a certain series of assignments to variables of the expression could
evaluate entire expression to be true. Cook's theorem shows that all NP problems can be reduced to SAT problem in polynomial time.
