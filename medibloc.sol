//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract MedicalRecords{
    uint public recordId;
    mapping(uint => Record) records;
    mapping(uint => bool) public isDeleted;

    struct Record {
        uint recordId;
        uint timestamp;
        string name;
        uint age;
        string gender;
        string bloodType;
        string allergies;
        string diagnosis;
        string treatment;
    }

    event MedicalRecords__AddRecord(
        uint recordId,
        uint timestamp,
        string name,
        uint age,
        string gender,
        string bloodType,
        string allergies,
        string diagnosis,
        string treatment
    );

    event MedicalRecords__DeleteRecord(
        uint recordId
    );

    function addRecord(
        string memory _name,
        uint _age,
        string memory _gender,
        string memory _bloodType,
        string memory _allergies,
        string memory _diagnosis,
        string memory _treatment
    ) public {
        recordId++;
        records[recordId] = Record(
            recordId,
            block.timestamp,
            _name,
            _age,
            _gender,
            _bloodType,
            _allergies,
            _diagnosis,
            _treatment
        );
        emit MedicalRecords__AddRecord(
            recordId,
            block.timestamp,
            _name,
            _age,
            _gender,
            _bloodType,
            _allergies,
            _diagnosis,
            _treatment
        );
    }

    function deleteRecord(uint _recordId) public {
        require(!isDeleted[_recordId], "The record is already deleted");
        emit MedicalRecords__DeleteRecord(_recordId);
        isDeleted[_recordId] = true;
    }
}
