class Data{
  String ques;
  String ans;
  String explanation;
  String id;
  List <dynamic> options;
  //bool fav;

  //Data(this.ques, this.ans);

  dataMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['question'] = ques;
    mapping['answer'] = ans;
    mapping['options'] = options;
    mapping['explanation'] = explanation;
    //mapping['favourite'] = fav;

    return mapping;
  }
}