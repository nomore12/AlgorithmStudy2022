// 1번 문제와 유사함.
function solution(pos) {
  // 나이트의 이동 계산기(?)
  const knightMove = [[2, -1], [2, 1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [1, -2]];
  let count = 0;
  // 나이트의 이동 가능한 위치는 최대 8개. 8회 반복문에서 이동 가능한 위치를 찾는다.
  for (let i = 0; i < knightMove.length; i++) {
    const isMove = isMoveable(pos, knightMove[i][0], knightMove[i][1]);
    count = isMove ? count + 1 : count;
  }
  return count;
}

// 이동 가능여부를 계산하여 반환하는 함수.
function isMoveable(curr, x, y) {
  const current = [curr[0] + x, curr[1] + y];
  if (current[0] > 8 || current[0] < 1 || current[1] > 8 || current[1] < 1) {
    return false;
  }
  return true;
}

console.log('result', solution([2, 7]))