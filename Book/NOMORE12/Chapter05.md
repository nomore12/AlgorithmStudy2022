# 탐색 알고리즘

## 정리

### 스택

> 후입선출의 자료구조. 보통 값을 넣을때 push(), 값을 가져 올 때 pop() 함수를 이용한다.

```javascript
class Stack {
  constructor() {
    this._stack = [];
    this._count = 0;
  }

  push(obj) {
    this._stack.push(obj);
    this._count = this._count + 1;
    console.log(this._stack);
  }

  pop() {
    if (this._count === 0) return null;
    const result = this._stack[this._stack.length - 1]
    this._stack = this._stack.slice(0, this._stack.length - 1);
    this._count = this._count - 1;
    console.log(this._stack);
    return result;
  }

  count() {
    return this._count;
  }
}

const stack = new Stack();
stack.push(1);
stack.push(2);
stack.pop();
stack.push(3);
[1, 3]
```

### 큐

> 선입선출의 자료구조.값을 넣을때 enqueue(), 값을 가져올 때 dequeue() 함수를 사용한다.

```javascript
class Queue {
  constructor() {
    this._queue = [];
    this._count = 0;
  }

  enqueue(arr) {
    this._queue = Array.prototype.concat(this._queue, arr);
    this._count = this._count + 1;
  }
  
  dequeue() {
    if (this._count === 0) return null;
    if (this._count === 1) {
      this._count = 0;
      const result = this._queue[0];
      this._queue = [];
      console.log(result, this._queue)
      return result;
    }
    const result = this._queue.slice(0, 1);
    this._queue = this._queue.slice(1, this._count);
    this._count = this._count - 1;
    return result[0];
  }

  count() {
    return this._count;
  }
}

const queue = new Queue();
queue.enqueue(1);
queue.enqueue(2);
queue.enqueue(3);
queue.dequeue(); // 1
[2, 3]
```

### 함께 구현한 노드 자료구조

> 위의 스택, 큐와 함께 사용하기 위해 구현.
> 생성자로 노드를 생성한 후 add()로 기존 노드에 연결. getName(), getChilds(), isVisited(), info()로 노드의 정보를 가져온다.

```javascript
class Node {
  constructor(name) {
    this._nodes = [];
    this._visited = false;
    this._name = name;
  }

  add(nodes) {
    this._nodes = Array.prototype.concat(this._nodes, nodes);
  }

  getName() {
    return this._name;
  }

  getChilds() {
    return this._nodes;
  }

  setVisit() {
    this._visited = !this._visited ? true : this._visited;
  }

  isVisited() {
    return this._visited;
  }

  info() {
    const names = this._nodes.map((item) => item.getName());
    console.log(`${this._name}: ${this._visited}, ${names}`);
  }
}

const first = new Node(1);
const second = new Node(2);
const third = new Node(3);
const fourth = new Node(4);
const fifth = new Node(5);
const sixth = new Node(6);
const seventh = new Node(7);
const eighth = new Node(8);

first.add([second, third, eighth]);
second.add([first, seventh]);
third.add([first, fourth, fifth]);
fourth.add([third, fifth]);
fifth.add([third, fourth]);
sixth.add([seventh]);
seventh.add([second, sixth, eighth]);
eighth.add([first, seventh]);

first.info();
second.info();
third.info();
fourth.info();
fifth.info();
sixth.info();
seventh.info();
eighth.info();
```

### DFS

> 깊이 우선 탐색이라고 부르며, 노드의 자식을 우선적으로 탐색하는 알고리즘. 노드를 스택 처리하여 재귀적으로 탐색한다.

### BFS

> 너비 우선 탐색이라고 부르며, 노드의 형제를 우선적으로 탐색하는 알고리즘. 노드를 큐에 넣은 뒤 순서대로 탐색한다.

## 문제

### 음료수 얼려먹기

```javascript
function solution(arr) {
  const height = arr.length;
  const width = arr[0].length;

  let result = 0;
  let [x, y] = [0, 0];
  for(let i = 0; i < height; i++) {
    for(let j = 0; j < width; j++) {
      if(dfs(arr, j, i, width, height)) {
        result = result + 1;
      }
    }
  }
  return result;
}

function dfs(graph, x, y, width, height) {
  if(x < 0 || y < 0 || x >= width || y >= height) {
    return false;
  }

  if(graph[y][x] === 0) {
    graph[y][x] = 1;
    dfs(graph, x - 1, y, width, height);
    dfs(graph, x + 1, y, width, height);
    dfs(graph, x, y - 1, width, height);
    dfs(graph, x, y + 1, width, height);
    return true;
  } 
  return false;
}
```

### 미로 탈출

```javascript
function bfs(maze) {
  const height = maze.length;
  const width = maze[0].length;

  const dx = [-1, 1, 0, 0];
  const dy = [0, 0, -1, 1];

  const queue = [];
  queue.push([0, 0]);
  while(queue.length > 0) {
    const [posX, posY] = queue.shift();
    for(let i = 0; i < 4; i++) {
      const [nX, nY] = [posX + dx[i], posY + dy[i]];
      
      if(nX < 0 || nY < 0 || nX >= width || nY >= height) {
        continue;
      }

      if(maze[nY][nX] === 0) continue;

      if(maze[nY][nX] === 1) {
        maze[nY][nX] = maze[posY][posX] + 1;
        queue.push([nX, nY]);
      }
    }
    
  }

  return maze[height - 1][width - 1];
}
```

### 타겟 넘버

```javascript
function targetNumber(numbers, target) {
  let count = 0;
  const multiply = [1, -1];

  multiply.forEach((item) => {
    dfs(0, item, 0);
  })

  function dfs(idx, mult, sum) {
    if(idx === numbers.length) {
      if(sum === target) {
        count = count + 1;
      }
      return;
    }

    sum = sum + numbers[idx] * mult;
    dfs(idx + 1, 1, sum);
    dfs(idx + 1, -1, sum);
  }

  return count / 2;
}
```
