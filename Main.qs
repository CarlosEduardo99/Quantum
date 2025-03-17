// Importandi bibliotecas
import Microsoft.Quantum.Convert.*;
import Microsoft.Quantum.Math.*;

    operation Main() : Int{
        let min = 100;
        let max = 200;
        Message($"Gerando um número aleatório entre {min} e {max}: ");

        // Gerando um número aleatório entre 'min' e 'max'
        return GenerateRandomNumberInRange(min, max);
    }

    // Gerar um número verdadeiramente aleatório entre 'min' e 'max'.
    operation GenerateRandomNumberInRange(min : Int, max : Int) : Int {
        // Determine o número de bits necessários para representar 'max' e salvar
        // na variável 'nBits'. Então gerar 'nBits' que vão representar
        // o número aleatório
        
        // Essa variável é mutable = pode ser alterada durante a computação
        // utilizamos a diretiva 'set' para alterar o valor de uma variável mutável
        mutable bits = [];

        // A função BitSizeI converte um inteiro no número de bits necessários
        // para representá-lo
        let nBits = BitSizeI(max);
        for idxBit in 1..nBits {
            set bits += [GenerateRandomBit()];
        }

        // A função ResultArrayAsInt converte a cadeia de caracteres de bits em um
        // número inteiro positivo
        let sample = ResultArrayAsInt(bits);

        // Retorna o número aleatório se estiver na faixa requisitada
        // Gera novamente se estiver fora da faixa
        return sample < min or sample > max ? GenerateRandomNumberInRange(min, max) | sample;
    }

    operation GenerateRandomBit(): Result{

        // Alocar um qubit
        use q = Qubit();

        // Colocar em superposição usando Hadamard
        H(q);

        // Medir o valor do qubit e salvar o valor
        let result = M(q);

        // Redefinir o qubitpara o estado |0>
        Reset(q);

        // Retornar o valor da medição
        return result;
    }