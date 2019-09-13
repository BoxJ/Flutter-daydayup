class People {
//  构建方法
  const People({
    this.name,
    this.avatar
  });
// 两个属性  final 不可变的  var 可以更改的
  final String name;
  final String avatar;
}
// 这里声明一个公开的数据源 后面外部需要使用填充cell
final List<People> boxArr = [
  People(name:'阿狸1',avatar: 'http://cache.fotoplace.cc/ap2/190521/0/7B5C54B95100DE281E689EEF24E499D9.png'),
  People(name:'阿狸2',avatar: 'http://cache.fotoplace.cc/ap2/190521/0/6478737E09CA39170389191133953111.png'),
  People(name:'阿狸3',avatar: 'http://cache.fotoplace.cc/ap2/190521/0/5FD190ECFF4943167F3D5F19A2973D6D.png')
];
