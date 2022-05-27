class CartHelper{
 static List<Modal> image = [
    Modal(
      image: 'Images/Orange.jpg',
      productName: 'Orange',
      price: 200,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Berries.jpg',
      productName: 'Berries',
      price: 300,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Lemons.jpg',
      productName: 'Lemons',
      price: 20,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Apples.jpg',
      productName: 'Apples',
      price: 1050,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Mangoes.jpg',
      productName: 'Mangoes',
      price: 10,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Dates.jpg',
      productName: 'Dates',
      price: 2000,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Rice.jpg',
      productName: 'Rice',
      price: 43,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Avocados.jpg',
      productName: 'Orange',
      price: 52,
      quantity: 0,
      total: 0,
    ),
    Modal(
      image: 'Images/Apples.jpg',
      productName: 'Orange',
      price: 140,
      quantity: 0,
      total: 0,
    ),
  ];


 static int conter=0;

 static updateCounter(){
   int total=0;
 image.forEach((e) {print("hello"); total=total+e.quantity;});
   conter=total;
 }


static List<Modal> get itemswithqty=>image.where((element) => element.quantity>0).toList();



 static itemTotalCount(Modal item){
   image.singleWhere((element) => element==item).total=item.quantity*item.price;
 }


 static addqty(Modal item){
   image.singleWhere((element) => element==item).quantity++;
   itemTotalCount(item);
 }

 static removeqty(Modal item){
   image.singleWhere((element) => element==item).quantity--;
   itemTotalCount(item);
 }
 static int get subtotal{

   int total=0;
   image.forEach((element) {total=element.total+total;});
   return total;
 }
}





class Modal {
  final String image;
  final String productName;
  int price;
  int quantity;
  int total;

  Modal({
    required this.image,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.total,
  });
}
