#include <stdio.h>
#include <stdlib.h>

struct node {
   int data;
   struct node *next;
};

struct node *head = NULL;
struct node *current = NULL;
struct node *prev = NULL;

void printList() {

   struct node *ptr = head;

   printf("\n[head] ->");
   while(ptr != NULL) {
      printf(" %d ->", ptr->data);
      ptr = ptr->next;
   }

   printf(" [null]\n");
}

void insert(int data) {
   struct node *link = (struct node*) malloc(sizeof(struct node));
   link->data = data;
   link->next = head;
   head = link;
}

void remove_data(int data) {
   int pos = 0;

   if(head == NULL) {
      printf("Linked List not initialized");
      return;
   }

   if(head->data == data) {
      if(head->next != NULL) {
         head = head->next;
         return;
      }else {
         head = NULL;
         printf("List is empty");
         return;
      }
   }else if(head->data != data && head->next == NULL) {
      printf("%d not found in the list\n", data);
      return;
   }

   current = head;

   while(current->next != NULL && current->data != data) {
      prev = current;
      current = current->next;
   }

   if(current->data == data) {
      prev->next = prev->next->next;
      free(current);
   }else
      printf("%d not found in the list.", data);

}

void find_data(int item) {
   int pos = 0;

   if(head == NULL) {
      printf("Linked List not initialized");
      return;
   }

   current = head;
   while(current->next!=NULL) {
      if(current->data == item) {
         printf("%d found at position %d\n", item, pos);
         return;
      }
      current = current->next;
      pos++;
   }
   printf("%d does not exist in the list", item);
}

int main() {
   insert(30);
   insert(1);
   insert(40);
   insert(42);

   printf("Printing the list...:");
   printList();
   printf("\n");

   printf("Removing the item 30...:");
   printf("\n");
   printf("List before the removal : ");
   printList();
   remove_data(30);
   printf("List after the removal : ");
   printList();
   printf("\n");

   printf("Searching for the item 40...");
   printf("\n");
   find_data(40);

   return 0;
}
