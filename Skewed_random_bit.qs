import Std.Diagnostics.DumpMachine;
import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Math.*;

operation Main() : Result {
    // Aloca um qubit
    use q = Qubit();

    let P = 0.333333; // Probabilidade de medir 0

    // Aplica uma rotação sobre o eixo Y por um ângulo que depende da probabilidade P
    // A rotação é feita sobre o qubit 'q'
    Ry(2.0 * ArcCos(Sqrt(P)), q);
    Message("O qubit está no estado desejado.");
    Message(" ");
    DumpMachine(); // Mostra o estado do qubit
    Message("Seu bit distorcido é: ");
    let skewedrandomBit = M(q);
    Reset(q);
    return skewedrandomBit;
}