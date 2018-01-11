// Interface to create child instances
contract ChildFactoryInterface {
    function createChild() returns (address) {}
}

// Interface to call child functions
contract ChildInterface {
    function f1() {}
    function f2() {}
    function f3() {}
    function f4() {}
    function f5() {}
    function cn() returns (uint) {}
}


// Main contract
contract Main {
    ChildInterface[] children;
    ChildFactoryInterface cfi;

    function Main(address _cf_address) {
        cfi = ChildFactoryInterface(_cf_address);
    }

    function addChild() returns (address child_address) {
        address _child_address = cfi.createChild();
        children.push(ChildInterface(_child_address));
        return _child_address;
    }

    function test(uint _child_number) returns (uint) {
        children[_child_number].f1();
        children[_child_number].f2();
        children[_child_number].f3();
        children[_child_number].f4();
        children[_child_number].f5();
        return children[_child_number].cn();
    }
}
