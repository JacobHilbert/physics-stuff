# Quantum Mechanics Stuff

For now, only notation for doing QM on Mathematica.

### BraKetHarmonic

Suppose you have a state `|Ψ> = |2>/√2 + |3>/√3 + |6>/√6`. You can generate it using 
```mathematica
psi = WaveFunction[Sqrt[2]->2, Sqrt[3]->3, Sqrt[6]->6]
```
Note how the weights are the multiplicative inverses, and goes first. 
You can have the conjugate transpose using `Dagger[psi]`, or `Ctrl + 6 + Esc + "dg" + Esc` (SuperDagger) or `psi^\[Dagger]`. 

`H`, `x` and `p` are defined as operators for the harmonic oscillator. Operator multiplication is done with `TensorProduct`, or `Esc + "t*" + Esc`, 
and for that reason you will need `TensorExpand` to do the calculations. In this example the expected values will be:
```mathematica
SuperDagger[psi]\[TensorProduct]H\[TensorProduct]psi // TensorExpand
SuperDagger[psi]\[TensorProduct]x\[TensorProduct]psi // TensorExpand
SuperDagger[psi]\[TensorProduct]p\[TensorProduct]psi // TensorExpand
```
Giving `7ħω/2`, `Sqrt[ħ/(mω)]` and `0` respectively.

If all the mixed states has the same probability, you don't have to specify the weights.
```mathematica
psi = WaveFunction[2,3,5,7,11] (* (|2>+|3>+|5>+|7>+|11>)/√5 *)
```

##### Time evolution

The same example state with its time evolution can be obtained with a `t` argument at the end of `WaveFunction`:
```mathematica
psi = WaveFunction[Sqrt[2]->2, Sqrt[3]->3, Sqrt[6]->6, t]
```

The time evolution of the observables `x`, `p` and energy, can be obtained the same way.

