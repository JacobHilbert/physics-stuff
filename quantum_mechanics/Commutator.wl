(*Multilinearity*)
Lie[a___,b_Times,c___]:=Select[b,NumericQ] Lie[a,Select[b,Not@*NumericQ],c]
Lie[a___,b_Plus,c___]:=Distribute[Unevaluated[Lie[a,b,c]]]
(*Alternativity*)
Lie[x_,x_]:=0
Lie[a___,0,c___]:=0
(*Leibniz*)
Lie[a___,b_TensorProduct,c___]:=Total[(i|->MapAt[x|->Lie[a,x,c],b,i])/@Range[Length[b]]]
(*Physical relations*)
Lie[a_p|a_x,b_p|b_x]:=Order[Head[b],Head[a]] KroneckerDelta[a[[1]],b[[1]]]I \[HBar]
(*Angular momentum*)
L[\[Gamma]_?NumericQ]:=Sum[LeviCivitaTensor[3][[\[Gamma],\[Mu],\[Nu]]] (x[\[Mu]]\[TensorProduct]p[\[Nu]]),{\[Mu],3},{\[Nu],3}]

(*Orthogonality of x and p*)
x/:x[i_]\[TensorProduct]x[j_]/;i=!=j:=0
p/:p[i_]\[TensorProduct]p[j_]/;i=!=j:=0
(*Numerical symbols*)
\[HBar]/:NumericQ[\[HBar]]=True;
