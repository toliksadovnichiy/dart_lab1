
void main(List<String> arguments) {
  int a = 1, b = 2;
  int? c;

  //ternary operator
  a < b ? c ??= a : c ??= b;
  print('c: $c\n');

  //cascade annotation operator
  MyClass obj = new MyClass('abc', 10, 20);
  obj
    ..showData()
    ..increaseX(c)
    ..increaseY(c)
    ..showData();

  //closure
  Function multiply(int mult){
    return (int cur) => cur * mult;
  }
  var multiply2 = multiply(2);
  var multiply3 = multiply(3);
  print('\nClosure:');
  print(multiply2(10));
  print(multiply3(10));

  //usinf default parameters
  print('\nDefault parameters');
  print(summator(10, 20));

  //using factory constructor (false - base obj, true - child obj)
  print('\nFactory:');
  bool state = true;
  var objFact = MyClassBase.fac(state);
  objFact.showData();

  //implementation
  print('\nImplementation:');
  Animal dog = new Dog();
  Animal cat = new Cat();
  dog.makeSomeNoice();
  cat.makeSomeNoice();

  //collections
  print('\nCollections:');
  var colors = ['red', 'green', 'blue'];
  var arr = <int>{1, 2, 3};
  var numbers = <int>{for (int i in arr) i};
  var powerOfTwo = {1:'2', 2:'4', 3:'8'};
  print(colors);
  print(numbers);
  print(powerOfTwo);
  print('');

  colors.add('white');
  colors.addAll(['greey', 'black']);
  powerOfTwo[4] = '16';
  print(colors);
  print(numbers);
  print(powerOfTwo);

  var numbersNew = <int>{...numbers, if(powerOfTwo[1]=='2') 4, if(powerOfTwo[1]=='3') 5};
  numbersNew.forEach((element) => print('n:$element, '));
  
  //Generic
  var list = <Object> [1, 'abc', 2.001];
  print(list);
  
  //where
  print('\nUsing where');
  var mySet = <MyClass>{MyClass('a', 1, 10), MyClass('a', 2, 20), MyClass('a', 1, 30)};
  var newSet = mySet.where((temp) => temp._x == 1);
  for (var m in newSet){
    m.showData();
  }


}

//unnecesary parameter
int summator(a, b, [c = 1]){
  return a + b + c;
}

class MyClass extends MyClassBase {
  int _x;
  int _y;
  int z;

  MyClass(String name, int this._x, int this._y, {this.z = 3}): super(name);

  MyClass.init(): _x = 1, _y = 2, z = 3, super.init();

  @override
  void showData(){
    print('name: $name');
    print('x: $_x');
    print('y: $_y');    
  }
  
  void increaseX(int num) => _x += num;
  void increaseY(int num) => _y += num;

  int get getX => _x;
  int get getY => _y;
  int get getZ => z;
  set setX(int x) => this._x = x;
  set setY(int y) => this._y = y;
  set setZ(int z) => this.z = z;
}

class MyClassBase {
  String name;

  MyClassBase(this.name);
  MyClassBase.init(): name = "square";

  factory MyClassBase.fac(state){
    return state ? MyClassBase.init() : MyClass.init();
  }

  void showData(){
    print('name: $name');   
  }

  String get getName => name;
  set setName(String n) => name = n;
}

abstract class Animal {
  void makeSomeNoice();
}

class Dog implements Animal {
  @override
  void makeSomeNoice() {
    print('Bow-Wow');
  }
}

class Cat implements Animal {
  @override
  void makeSomeNoice() {
    print('Meow');
  }
}