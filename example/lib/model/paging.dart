class Paging {
  String perPage;
  int currentPage, totalPages, items, totalItems;
  Paging(
      {this.perPage = "10",
      this.currentPage = 1,
      this.totalItems,
      this.totalPages = 1,
      this.items});
}
