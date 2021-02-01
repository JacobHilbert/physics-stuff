(* numerical symbols *)
\[HBar] /: NumericQ[\[HBar]] = True;
\[Omega] /: NumericQ[\[Omega]] = True;
t /: NumericQ[t] = True;
m /: NumericQ[m] = True;
\[HBar] /: Conjugate[\[HBar]] = \[HBar];
\[Omega] /: Conjugate[\[Omega]] = \[Omega];
t /: Conjugate[t] = t;
m /: Conjugate[m] = m;

(* Dagger *)
Dagger = SuperDagger;
SuperDagger /: SuperDagger[a]\[TensorProduct]Ket[n_] :=  Sqrt[n + 1] Ket[n + 1]
SuperDagger[expr__TensorProduct] := SuperDagger /@ Reverse[expr]
SuperDagger[expr__Plus] := SuperDagger /@ expr
SuperDagger[expr__Times] := SuperDagger /@ expr
SuperDagger[expr_?NumericQ] := Conjugate[expr]
SuperDagger[Ket[n_]] := Bra[n]
SuperDagger[Bra[n_]] := Ket[n]

(* Bra, Ket, and anihilator *)
Bra /: Bra[n_]\[TensorProduct]Ket[m_] :=
  Boole[n == m]
a /: a\[TensorProduct]Ket[n_] := Sqrt[n] Ket[n - 1]
a /: a\[TensorProduct]Ket[0] = Ket[0];
(* Identity operator *)
Id /: Id\[TensorProduct]Ket[n_] := Ket[n]

(* harmonic oscillator  specifics*)
\[ScriptCapitalE][n_] := (\[HBar] \[Omega])/2 (2 n + 1)
U[n_] := Exp[-((I t \[ScriptCapitalE][n])/\[HBar])]

WaveFunction[r__Rule] := Total@MapThread[Ket[#2] /#1 &, Transpose[{r} /. Rule -> List]]
WaveFunction[r__Rule, t] := Total@MapThread[Ket[#2] U[#2]/#1 &, Transpose[{r} /. Rule -> List]]
WaveFunction[n__?NumericQ, t] := Total[(Ket[#] U[#])/Sqrt[Length[{n}]] & /@ {n}]
WaveFunction[n__?NumericQ] := Total[Ket[#]/Sqrt[Length[{n}]] & /@ {n}]

x = Sqrt[\[HBar]/(2 m \[Omega])] (SuperDagger[a] + a);
p = I Sqrt[\[HBar]/(2 m \[Omega])] (SuperDagger[a] - a);
H = \[HBar] \[Omega] (SuperDagger[a]\[TensorProduct]a + 1/2 Id);
