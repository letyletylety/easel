# easel

The CustomPaint in declarative way

![Circle example](https://i.ibb.co/BPk0tmQ/circle-example.png)

```dart
Easel(
    width: 400,
    height: 400,
    components: [
        ...coordLines(400, 400),
        Circle(Point(100, 100), 100),
        Circle.xyr(-100, -100, 50, color: Colors.lightBlue)
    ],
),
```

## How to use?

see [Examples](https://letyletylety.gitlab.io/easel_by_example/)

## TODOs

- [ ] text
- [ ] 3D scene
- [ ] gesture detecting
- [ ] animation

## How to add new drawable?

---

### for contributor & maintainer

1. create new drawable class in the **/src/drawable directory**

2. create draw method in **[Easel]** class

3. update **[drawAll]** method in **[Easel]** class

4. make example in **example/artworks** directory

---

### for maintainer (after Task 1~4 done)

5. update pageOrder and router in **[index.dart]**

