// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.12;

contract Estudiante {

    string private _nombre;
    string private _apellido;
    string private _curso;
    string[] private _materias;
    uint8 private contador;
    address private docente;
    mapping(string => uint8) private notas_materias;
    
    constructor(string memory name_, string memory surname_, string memory curso_){
        _nombre = name_;
        _apellido = surname_;
        _curso = curso_;
        docente = msg.sender;
    }

    function Apellido() public view returns(string memory){
        return _apellido;
    }

    function _nombre_completo() public view returns(string memory){
        return string.concat(_nombre," ", _apellido);
    }

    function curso() public view returns(string memory){
        return _curso;
    }

    function set_nota_materia(string memory materia, uint8 valor) public{
        require(msg.sender == docente, "Solo el docente puede setear las notas");
        if(notas_materias[materia] == 0){
            _materias.push(materia);
        }
        notas_materias[materia] = valor;
    }

    function nota_materia(string memory materia) public view returns(uint8){
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns(bool){
        if(notas_materias[materia] >= 60){
            return true;
        }
        return false;
    }

    function promedio() public view returns(uint){
        uint  i;
        uint _promedio = 0;
        for(i = 0; i <= _materias.length ; i++){
            _promedio += notas_materias[_materias[i]];
        }
        return _promedio / i;
    }
}
