// 혼자 푸는데 실패함.

function solution(x, y, curr, map) {
  let pos = [curr[0], curr[1]];
  let dir = curr[2];
  let isBack = false;
  let count = 0;
  while (true) {
    pos, dir, isBack = moveCharacter(pos, dir, map, x, y, isBack);
    if (isBack) break;
    count++;
  }
  return count;
}

// 캐릭터 이동
// 현재위치, 방향, 맵, x, y, 뒤로가기 여부를 받는다.
function moveCharacter(curr, dir, map, x, y, isBack) {
  let isBackward = isBack;
  let move;
  switch (dir) {
    case 0:
      move = [0, -1];
      break;
    case 1:
      move = [1, 0];
    case 2:
      move = [0, 1];
    case 3:
      move = [-1, 0];
      break;
    default:
      move = [0, 0];
  }
  let coord = [curr[0] + move[0], curr[1] + move[1]];
  console.log(coord)
  if (coord[0] < 1 || coord[0] > x || coord[1] < 1 || coord[1] > y || map[move[1]][move[0]] === 1) {
    [move, moveDir, isBackward] = moveCharacter(curr, reverseDirection(dir), map, x, y, true);
    return move, moveDir, true;
  }
  const moveDir = isBackward ? dir : dir - 1 === -1 ? 3 : dir - 1;
  return move, turnLeft(dir), isBackward;
}

function reverseDirection(dir) {
  switch (dir) {
    case 0:
      return 2;
    case 1:
      return 3;
    case 2:
      return 0;
    case 3:
      return 1;
  }
}

function turnLeft(dir) {
  console.log('dir', dir);
  return dir === 0 ? 3 : dir - 1;
}

const map = [
  [1, 1, 1, 1],
  [1, 0, 0, 1],
  [1, 1, 0, 1],
  [1, 1, 1, 1],
]

console.log('result', solution(4, 4, [2, 2, 3], map));