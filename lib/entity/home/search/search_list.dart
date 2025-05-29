class SearchList {
  String title;



  List<Search> searchList;


  SearchList(this.title, this.searchList);
}

class Search {
  int id;

  int count;

  String name;

  Search(this.id, this.count, this.name);
}
