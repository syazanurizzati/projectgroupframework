import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../providers/contact.dart';
import 'contact_card.dart';

class AsstetList extends StatelessWidget {
  //class for list data
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //widget listdata
        padding: const EdgeInsets.all(20),
        itemCount: Contact.contacts.length, //kira data dlm table db
        itemBuilder: (BuildContext context, index) {
          final contact = Contact.contacts[index]; //mklumat data dlm table

          return Card(
              child: ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.role),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")
                  ),
                  onTap: (){
                    print("Click event on Container"); 
                    //Navigator.of(context).pushNamed("asdasd");
                  },
              )
          );
        }
    );
  }
}
