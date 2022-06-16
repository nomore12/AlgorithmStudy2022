function upDownLeftRight(n, direction) {
  let map = [];
  // 맵을 만든다.
  for (let i = 0; i < n; i++) {
    let row = [];
    for (let k = 0; k < n; k++) {
      row.push([k + 1, i + 1]);
    }
    map.push(row)
  }
  
  // 현재 위치와 이동 방향을 이용해 이동 가능한 방향인지 판단하여 위치를 저장
  let current = [1, 1];
  direction.forEach(item => {
    const cur = isMoveable(current, item);
    current = !cur ? current : cur;
  })
  
  return current;
}

// 이동 가능한 위치인지 판별하여 이동 가능하다면 이동 위치를 반환, 아니라면 현재 위치를 반환한다.
function isMoveable(cur, dir, n) {
  // 이동 방향에 사용될 좌표 계산 배열
  let direction;
  switch (dir) {
    case 'R':
      direction = [1, 0];
      break;
    case 'L':
      direction = [-1, 0];
      break;
    case 'U':
      direction = [0, -1];
      break;
    case 'D':
      direction = [0, 1];
      break;
    default:
      direction = [0, 0];
  }
  // direction과 현재 위치를 더해준다.
  const result = [cur[0] + direction[0], cur[1] + direction[1]];

  // 이동이 불가능하다면 현재 위치를 반환한다.
  if (result[0] > n || result[1] > n || result[0] < 1 || result[1] < 1) {
    return cur;
  }
  return result;
}

console.log('result', upDownLeftRight(5, ['R', 'R', 'R', 'U', 'D', 'D']))