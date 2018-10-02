// https://www.facebook.com/groups/creativecodingp5/permalink/2122655714649127/?__xts__[0]=68.ARD5Z-1zZ4zk07fzsDM585-Chpvv7unkiSZEJoszo2I2oagnc8HTgjLZnTf7z4tQo0MxUaBm1Yjd4dcDhCY0TbMqLGuELD9cP0g0fVHY_XELnDWNd5Cvk6VfdzLsJtXsrT829M8IBkYP&__tn__=-R

IntList inventory, temp;
int [] myList = {1,2,3,4,5};


void setup() {
  size(200, 200);
  inventory = new IntList();
  for (int i = 1; i < 11; i++) {
    inventory.set(i-1, i);
  }
  //println(inventory);
  
  noLoop();
}

void draw() {
  // méthode 1
  temp = new IntList();
  temp.append(inventory.get(inventory.size()-1));
  inventory.remove(inventory.size()-1);
  temp.append(inventory);
  inventory = temp;
  
  //println(inventory);
  
  // méthode 2
  myList = splice(myList, myList[myList.length-1], 0);
  myList = shorten(myList);
  
  println(str(myList));
 
}

void mousePressed() {
  redraw();
}
