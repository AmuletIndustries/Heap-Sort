int ar[] = new int [5000000];

void setup(){
  //generates a random array and prints it
  for(int i=0;i<ar.length;i++){
    ar[i] = int(random(1,ar.length));
  }
  int n=ar.length;
  //build heap
  for(int i=n/2-1;i>=0;i--){
    ar = heapify(ar,n,i);
  }

  for(int i=n-1;i>=0;i--){
    //swaps the first and last digits
    int temp = ar[0];
    ar[0] = ar[i];
    ar[i] = temp;
    
    ar = heapify(ar, i, 0);
  }
  
  println("Sorted:");
  println(ar);
}

 //function that generates a heap from the array
 //i is the root
int[] heapify(int arr[], int n, int i){
   int largest = i;//inits largest as root of heap
   int l=2*i+1;//inits left as double the root plus 1 in the array
   int r=2*i+2;//inits right as double the root plus 2 in the array
   //if left is larger than root
   if(l<n&& arr[l]>arr[largest]){
     largest=l;
   }
   //if right is larger than root
   if(r<n&& arr[r]>arr[largest]){
     largest = r;
   }
   //if largest is not root
   if(largest != i){
     int temp = arr[i];
     arr[i] = arr[largest];
     arr[largest] = temp;
     
     heapify(arr, n, largest);
   }
   
   return arr;
}