import Microsoft.Quantum.Diagnostics.*;

operation Main() : Result {
    use q = Qubit();
    Message("Qubit inicializado:");
    DumpMachine(); // Primeiro DumpMachine() para mostrar o estado do qubit
    Message(" ");
    
    // Colocar em superposição usando Hadamard
    H(q);
    Message("Qubit após a aplicação do Hadamard:");
    DumpMachine(); // Segundo DumpMachine() para mostrar o estado do qubit
    Message(" ");

    let randomBit = M(q);
    Message("Qubit após a medição:");
    DumpMachine(); // Terceiro DumpMachine() para mostrar o estado do qubit
    Message(" ");
    Reset(q);

    Message("Qubit após o reset:");
    DumpMachine(); // Quarto DumpMachine() para mostrar o estado do qubit
    Message(" ");

    return randomBit;
}