import Std.Convert.ResultArrayAsBoolArray;
import Std.Diagnostics.DumpMachine;
import Std.Arrays.ForEach;
import Microsoft.Quantum.Diagnostics.*;
import Microsoft.Quantum.Math.*;
import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Arrays.*;

operation Main() : Int {
    // Aloca 3 qubits
    use qubits = Qubit[3];

    // Colocar os qubits em superposição
    ApplyToEach(H, qubits);
    Message("Registro de qubits em uma superposição uniforme:");
    DumpMachine(); // Mostra o estado dos qubits

    let result = ForEach(M, qubits);
    Message("Medindo o colapso dos qubits de superposição para um estado de base:");
    DumpMachine(); // Mostra o estado dos qubits
    ResetAll(qubits);

    // Converte o array de resultados em um número inteiro
    return BoolArrayAsInt(ResultArrayAsBoolArray(result));

    // Em resumo, este código cria um registro de 3 qubits,
    // coloca-os em uma superposição uniforme, mede-os, 
    // exibe os estados quânticos antes e depois da medição,
    // redefine os qubits e retorna o resultado da medição como um inteiro.
}