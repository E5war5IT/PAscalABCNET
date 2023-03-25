program Program2;

type
ILinkedList  = interface
      function getList(): array of integer;
      function indexOf(value: integer): integer;
      function next(): integer;
      function dropHead(): integer;
      function drop(): integer;
      function head(): integer;
      function has(value: integer): boolean;
      function setItem(item: integer): integer;
      function getItem(index: integer): integer;
      property size: integer read;
end;

type
  LinkedList = class(ILinkedList)
  private
    list: array of integer;
    current: integer = 0;
    listCounter: integer = 0;
  
  public
    constructor(n: integer);
    begin
        list := new integer[n];
    end;
    
    function getList(): array of integer;
    begin
      Result := list;
    end;
    
    function indexOf(value: integer): integer;
    begin
      var index: integer;
      for var i := 0 to list.Length - 1 do
        if list[i] = value then index := i - 1;
      Result := index;
    end;
    
    function next(): integer;
    begin
      current += 1;
      Result := current = list.Length ? 0 : list[current];
    end;
    
    function dropHead(): integer;
    begin
      list := list.Where((i, j)-> j <> 0).ToArray();
    end;
    
    function drop(): integer;
    begin
      for var index := 0 to list.Length + 1 do
        list := list.Where((i, j)-> (j <> index) and (i <> index)).ToArray();
    end;
    
    function head(): integer;
    begin
      Result := list[0];
    end;
    
    function has(value: integer): boolean;
    begin
      var hasValue := false;
      for var i := 0 to list.Length - 1 do
        if list[i] = value then hasValue := true;
      Result := hasValue;
    end;
    
    function setItem(item: integer): integer;
    begin
      list[listCounter] := item;
      listCounter += 1;
      Result := item;
    end;
    
    function getItem(index: integer): integer;
    begin
      if (index = list.Length - 1) or (index >= list.Length) then
        Result := 0
      else if index = 0 then
        Result := list[1]
      else if index > 0 then
        Result := list[index + 1];
    end;
    
    property size: integer read list.Length;
  end;

begin
  var linkList := new LinkedList(5);
  linkList.setItem(4);
  linkList.setItem(3);
  linkList.setItem(5);
  linkList.setItem(7);
  linkList.setItem(1);
  
  Println(linkList.getList());
  
  Println('=' * 10);
  Println('sizeof list:', linkList.size);
  Println('=' * 10);
  
  Print('[0]: ');  Println(linkList.getItem(0));
  Print('[1]: ');  Println(linkList.getItem(1));
  Print('[2]: ');  Println(linkList.getItem(2));
  Print('[3]: ');  Println(linkList.getItem(3));
  Print('[4]: ');  Println(linkList.getItem(4));
  Print('[5]: ');  Println(linkList.getItem(5));
  
  Println('=' * 10);
  
  Println('has 3:', linkList.has(3));
  Println('has 4:', linkList.has(4));
  Println('has 6:', linkList.has(6));
  
  Println('=' * 10);
  
  Println('indexOf(3):', linkList.indexOf(3));
  Println('indexOf(1):', linkList.indexOf(1));
  
  Println('=' * 10);
  Println('next: ', linkList.next());
  Println('=' * 10);
  
  Println('dropHead:', linkList.dropHead());
  Println(linkList.getList());
  
  Println('drop:', linkList.drop());
  Println(linkList.getList());
  
  Println('=' * 10);
  Println('sizeof list:', linkList.size);
  Println('=' * 10);
end.