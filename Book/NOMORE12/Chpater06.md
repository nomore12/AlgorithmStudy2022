# 정렬 알고리즘

## 정리

정렬이란 데이터를 특정한 기준에 의해 순서대로 나열하는 것.

### 선택정렬

가장 원시적인 방법으로, 가장 작은 데이터를 선택해 제일 앞에있는 데이터와 바꾸고, 그 다음 작은 데이터를 선택해 앞에서 두 번째 데이터와 바꾸는 과정을 반복하는 정렬법.

```javascript
let array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8];

for(let i = 0; i < array.length; i++) {
  let minIndex = i;
  for(let j = i + 1; j < array.length; j++) {
    if(array[minIndex] > array[j]) {
      minIndex = j;
    }
  }
  let [min, next] = [array[minIndex], array[i]];
  [array[i], array[minIndex]] = [min, next];
}
```

배열의 크기만큼 순회하며 또 한번 순회하며 요소간의 크기를 비교하여 정렬한다. 기본적으로 모든 요소를 비교하는 이중 순회 구조를 갖고 있어 선택정렬의 시간 복잡도는 O(N^2)이다. 정렬해야 하는 데이터가 많아질수록 효율이 안좋아지지만 적은 데이터는 간단한 코드로 정렬할 수 있다.

### 삽입정렬

```javascript
let array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8];

for(let i = 0; i < array.length; i++) {
  for(let j = i; j >= 0; j--) {
    if(array[j] < array[j - 1]) {
      let [first, second] = [array[j - 1], array[j]];
      [array[j], array[j - 1]] = [first, second];
    } else {
      break;
    }
  }
}
```



### 퀵정렬

### 계수정렬