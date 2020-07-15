Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(200),
    border: Border.all(color: Colors.indigoAccent, width: 8),
    boxShadow: [
      BoxShadow(
        color: Color(0x332222CC),
        blurRadius: 6,
        spreadRadius: 6,
        offset: Offset.fromDirection(0, 0),
      ),
    ]
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(400),
    child: Image.network("https://avatars2.githubusercontent.com/u/32353047?s=400&u=3eda4ea840d9a8918078e0337fe64a9bec634dd0&v=4",height: 200,width: 200,),
  ),
);
