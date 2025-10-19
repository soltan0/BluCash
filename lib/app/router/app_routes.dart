enum AppRoutes {
  firstNameLastName('/firstnamelastname'),
  cardVerification('/cardverification'),
  paymentProcess('/paymentprocess'),
  addCartLoading('/addcartloading'),
  notification('/notification'),
  CreateAPincode('/createapincode'),
  ConformAPincode('/conformapincode'),
  addCart('/addcart'),
  register('/register'),
  setting('/setting'),
  pinCode('/pincode'),
  faceID('/faceid'),
  splash('/splash'),
  home('/home'),
  opt('/otp');

  const AppRoutes(this.path);

  final String path;
}
