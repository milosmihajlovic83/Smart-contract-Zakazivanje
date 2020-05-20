pragma solidity ^0.5.0;

contract Zakazivanje {

struct User {
uint id;
string ime;
uint jmbg;
string ambulanta;
}

User[] users;
uint nextId = 1;

function zakazivanje(string memory ime, uint jmbg, string memory ambulanta) public {
users.push(User(nextId, ime, jmbg, ambulanta));
nextId++;
}

function brojZakazanih() view public returns(uint) {
return users.length;
}

function pretrazi(uint jmbg) view public returns(string memory) {
for (uint i = 0; i < users.length; i++){
if(users[i].jmbg == jmbg) {
return users[i].ime;
}
}
revert('Korisnik sa naznačenim JMBG-om nije zakazan!');
}

}