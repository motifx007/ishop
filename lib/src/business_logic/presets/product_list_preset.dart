import 'package:ishop/src/business_logic/model/product_list.dart';

List<ProductCategory> getProductList() {
  List<ProductCategory> _productList = <ProductCategory>[];

  _productList.add(
    ProductCategory(
      name: 'Products',
      products: [
        Products(
          id: '552fe28f-6e89-4286-923d-1e0bcdbd4f2b',
          name: 'iPhone 12',
          price: 65900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone12-digitalmat-gallery-2-202111?wid=364&hei=333&fmt=png-alpha&.v=1635178709000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '4a041b73-2bd2-4cac-b73e-7e54919c1743',
          name: 'iPhone 13 Pro',
          price: 119900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone13pro-digitalmat-gallery-3-202111?wid=364&hei=333&fmt=png-alpha&.v=1635487442000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '301a80b2-e0e5-42db-9f65-cf84c78d3fe9',
          name: 'iPad Pro',
          price: 71900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-pro-12-11-select-202104_GEO_IN?wid=545&hei=550&fmt=jpeg&qlt=95&.v=1617864721000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: 'baf01011-5495-4acf-8bb8-7b910d132776',
          name: 'iPad mini',
          price: 46900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-mini-select-202109?wid=540&hei=530&fmt=jpeg&qlt=95&.v=1631751017000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '6d694789-e72e-46ae-b3c2-dad54780af73',
          name: 'Apple Watch Series 3',
          price: 20900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/watch-compare-s3-202009?wid=220&hei=273&fmt=jpeg&qlt=95&.v=1600310839000',
          quantity: 0,
          taxPercentage: 7,
        ),
      ],
    ),
  );

    _productList.add(
    ProductCategory(
      name: 'Accessories',
      products: [
        Products(
          id: 'fbccff95-449c-4e43-b33e-33a0547098b5',
          name: 'AirTag',
          price: 3190.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airtag-single-select-202104_FV1?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761670000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: 'ab38d8dd-2d09-4a9b-ae0e-642c324cfe12',
          name: 'AirPods',
          price: 18500.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MME73_AV2?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1632861338000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '37fc9f72-75d9-4581-946f-271adc30133e',
          name: 'iPhone 13 Pro Silicone Case with MagSafe',
          price: 41900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MM2D3?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1629923573000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '7019ee09-b351-40b0-97e0-9a9d399b7daf',
          name: '20W USB-C Power Adapter',
          price: 1900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MU862?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591824860000',
          quantity: 0,
          taxPercentage: 7,
        ),
        Products(
          id: '74241685-16e6-4318-bd25-075ad87ff75e',
          name: 'AirPods Max',
          price: 59900.00,
          mainImage: 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-max-select-spacegray-202011?wid=470&hei=556&fmt=png-alpha&.v=1604709508000',
          quantity: 0,
          taxPercentage: 7,
        ),
      ],
    ),
  );

  return _productList;
}
