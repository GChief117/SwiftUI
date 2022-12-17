//
//  main.cpp
//  Circular
//
//  Created by Nelson, Gunnar on 11/16/22.
//

#include <iostream>
using namespace std;

class Node  {
public:
  string data;
  Node *next;
};

class SingleCircleLink  {
public:
  Node *head;
  Node *tail;  //Create a One-way Circular Linked List
  
  SingleCircleLink()  {
    head = new Node(); // the first node called head node
    head->data = "A";
    head->next = NULL;
    
    Node *nodeB = new Node();
    nodeB->data = "B";
    nodeB->next = NULL;
    head->next = nodeB;
    
    Node *nodeC = new Node();
    nodeC->data = "C";
    nodeC->next = NULL;
    nodeB->next = nodeC;
    
    tail = new Node(); // the last node called tail node
    tail->data = "D";
    tail->next = head;
    nodeC->next = tail;
  }
  
  void output()  {
    Node *p = head;
    do // Print from the beginning to the end
    {
      cout << p->data << " -> ";
      p = p->next;
    } while (p != head);
    cout << p->data;
  }
  
  ~SingleCircleLink()  {
    Node *p = head;
    Node *temp = p;
    do  {
      temp = p;
      p = p->next;
      delete temp; //free memory
    } while (p != head);
  }
};

int main()  {
  SingleCircleLink *circleLink = new SingleCircleLink();
  circleLink->output();
  delete circleLink;
  return 0;
}
