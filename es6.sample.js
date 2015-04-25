import exp, {pi, e} from "lib/mathplusplus";

export default class SkinnedMesh extends THREE.Mesh {
  constructor(geometry, materials) {
    super(geometry, materials);

    this.idMatrix = SkinnedMesh.defaultMatrix();
  }
  update(camera) {
    //...
    super.update();
  }
  static defaultMatrix() {
    return new THREE.Matrix4();
  }
}

nums.forEach(v => {
  if (v % 5 === 0)
    fives.push(v);
});

