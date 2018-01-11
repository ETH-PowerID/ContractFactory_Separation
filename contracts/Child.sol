contract Child {

    uint child_number;
    uint i1;
    uint i2;
    uint i3;
    uint i4;
    uint i5;

    function Child(uint _child_number) {
        child_number = _child_number;
    }

    function f1() { i1=1;   }
    function f2() { i2=2;   }
    function f3() { i3=3;   }
    function f4() { i4=4;   }
    function f5() { i5=5;   }
    function cn() returns (uint) { return child_number;   }
}


contract ChildFactory {
    Child[] children;

    function ChildFactory() {
    }

    function createChild() public returns (address) {
        Child ch = new Child(children.length);
        children.push(ch);
        return ch;
    }

    function getChildAddress(uint _child_number) public returns (address child_address) {
      return children[_child_number];
    }
}
