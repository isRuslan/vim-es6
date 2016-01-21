import exp, {pi, e} from "lib/mathplusplus";

export default class SkinnedMesh extends THREE.Mesh {
  constructor(geometry, materials) {
    super(geometry, materials);

    this.idMatrix = SkinnedMesh.defaultMatrix();
  }
  update(camera) {
    //...
    let $camera = camera;
    const $top = camera.map(c => c + 1);

    function *name (arg) {
      console.log(`${args.foo ? `first-${args.foo}` : null}`);
      yield arg;
    }

    super.update();
  }

  static defaultMatrix() {
    return new THREE.Matrix4();
  }
}

nums.forEach(v => {
  if (v % 5.1 === 0)
    fives.push(v);
});


