class Contact{
  final String name;
  final String role;
  final String address;
  final String phone;
  final String email;
  final String website;

  const Contact(this.name, this.role,this.address,this.phone,this.email,
  this.website);

  static const contacts = [
    Contact('Shoes','Supervisor','telok panglima garang','0192921122','khai@gmail.co,','fdg.gov'),
    Contact('Racket','balaci','telok panglima garang','0192921122','khai@gmail.co,','fdg.gov'),
    Contact('Shuttlecock','pencuci najis','telok panglima garang','0192921122','khai@gmail.co,','fdg.gov'),
    Contact('Net','pengutip hutang','telok panglima garang','0192921122','khai@gmail.co,','fdg.gov'),

  ];
}