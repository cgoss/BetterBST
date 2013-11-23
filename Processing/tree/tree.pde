/*
Project used to represent the nodes of a BST with my implementation.

*/
String bstDirectory = "E:/Images/StartBad/";
String BSTFileName = "BST-########.png";
String deleteSaveDir = bstDirectory+""+BSTFileName;
String deleteSaveNoBalance = bstDirectory+""+BSTFileName;
String DeleteOnly = bstDirectory+""+BSTFileName;
String InsertNoBalance =bstDirectory+""+BSTFileName;
String InsertWBalance =bstDirectory+""+BSTFileName;
String NoBalance =bstDirectory+""+BSTFileName;
String BalanceOnly =bstDirectory+""+BSTFileName;
  
  int rand = 0;
int i = 0;
double totalInsTimeMils = 0;
double totalDelTimeMils = 0;
double totalSearchTimeMils = 0;
double avgTimeMils = 0;
double avgInsTimeMils = 0;
double avgDelTimeMils = 0;
double avgSearchTimeMils = 0;
double begin =0;
 
double avg = 0;
int itteration = 0;
int max = 0;
float theta;

BST tree;
boolean debug = true;
boolean bTest = false;
boolean outputImage = true;
boolean bInsert = false;
boolean bDelete = false;
boolean bBalance = false;
void setup() {
  f = loadFont( "Courier-30.vlw" );
  //Test runs through 
 String test = "S E A R C H E X A M P L E ";
  
    String[] keys = test.split(" "); 
    int N = keys.length; 
    BST<String, Integer> st = new BST<String, Integer>();
    st.setInsert(true);
    st.setDelete(true);
    if (debug)
               println("run Test");
    for (int i = 0; i < N; i++) 
    {
        st.put(keys[i], i);
       st.check(); 
    }
    if (debug)
               println("test complete");
    buildBST();
    frameRate(16);
    size(1024, 768);
}
  
    

      String[] array = 
            { 
            "1",            "2",            "3",            "4",            "5",            "6",            "7",            "8",            "9",            "10",            "11",            "12",            "13",            "14",            "15",            "16",            "17",            "18",            "19",            "20",            "21",            "22",            "23",            "24",            "25",            "26",            "27",            "28",            "29",            "30",            "31",            "32",            "33",
            "34",            "35",            "36",            "37",            "38",            "39",            "40",            "41",            "42",            "43",            "44",            "45",            "46",            "47",            "48",            "49",            "50",            "51",            "52",           "53",            "54",            "55",            "56",            "57",            "58",            "59",            "60",            "61",            "62",            "63",            "64",            "65",
            "66",            "67",            "68",            "69",            "70",            "71",            "72",            "73",            "74",            "75",            "76",            "77",            "78",            "79",            "80",            "81",            "82",            "83",            "84",           "85",            "86",            "87",            "88",            "89",            "90",            "91",            "92",            "93",            "94",            "95",            "96",            "97",
            "98",            "99",            "100",            "101",            "102",            "103",            "104",            "105",            "106",            "107",            "108",            "109",            "110",            "111",            "112",            "113",            "114",            "115",            "116",            "117",            "118",            "119",            "120",            "121",            "122",            "123",            "124",            "125",            "126",            "127",            "128",            "129",            "130",            "131",            "132",            "133",            "134",            "135",            "136",            "137",            "138",            "139",            "140",            "141",            "142",            "143",            "144",            "145",
            "146",            "147",            "148",            "149",            "150",           "151",            "152",            "153",            "154",            "155",            "156",            "157",            "158",            "159",            "160",           "161",            "162",            "163",            "164",            "165",            "166",            "167",            "168",            "169",            "170",            "171",            "172",            "173",            "174",            "175",            "176",            "177",
            "178",            "179",            "180",            "181",            "182",            "183",            "184",            "185",            "186",            "187",            "188",            "189",            "190",            "191",            "192",            "193",            "194",            "195",            "196",            "197",            "198",            "199",            "200",            "201",            "202",            "203",            "204",            "205",            "206",            "207",            "208",            "209",
            "210",            "211",            "212",            "213",            "214",            "215",            "216",            "217",            "218",            "219",            "220",            "221",            "222",            "223",            "224",            "225",            "226",            "227",            "228",            "229",            "230",            "231",            "232",            "233",            "234",            "235",            "236",            "237",            "238",            "239",            "240",            "241",
            "242",            "243",            "244",            "245",            "246",            "247",            "248",            "249",          "250",            "251",            "252",            "253",            "254",            "255",            "256",            };
        
void buildBST()
{
  tree = new BST<String, Integer>();
           tree.setInsert(true);
        tree.setDelete(true);
        tree.setBalance(true);
      
        int rand = 0;
        //load the array.
        for (int i = 0; tree.size() < 155; i++) 
        {    
          rand = (int)random(255);//randInt(0,255);
          tree.put(array[rand], i); 
    
        }
  if (bTest)
{  
  String test = "S E A R C H E X A M P L E ";
      //String test = "";
        String[] keys = test.split(" "); 
        int N = keys.length; 
       // BST<String, Integer> 
  tree = new BST<String, Integer>();
        tree.setInsert(bInsert);
        tree.setDelete(bDelete);
        tree.setBalance(bBalance);
        for (int i = 0; i < N; i++) 
        {
            tree.put(keys[i], i); 
        }
}
}


void draw() {
if (debug)
               println("draw");
  if (tree ==null)
   { 
     buildBST();
     //tree =  new BST<String, Integer>();
        tree.setInsert(bInsert);
        tree.setDelete(bDelete);
        tree.setBalance(bBalance);
        tree.setDebug(debug);
   }
    
   i++;
  
       for (int n = 0; tree.size() > 149; n++) 
             {
               if (debug)
               println(tree.size());
               String toDelete = array[(int)random(255)];
              String x = tree.selectkey(toDelete);
             if (x != null)
               {
               if (debug)
               println("begin delete " + x);
               begin = millis();
               tree.delete(toDelete);
               totalDelTimeMils = totalDelTimeMils + (begin -millis());
               avgDelTimeMils = totalDelTimeMils / i;
               if (debug)
               println("complete delete");
               continue;
               } 
             
             }
     for (int n = 0; tree.size() < 150; n++) 
             {    
               rand = (int)random(255);
               if (debug)
               println(tree.size());
             if (tree.selectkey(array[rand])== null)
               {
                 if (debug)
               println("insert ");
                   begin = millis();
                 //  StdOut.println("Insert " + array[rand]);  
                   tree.put(array[rand], i); 
                   totalInsTimeMils = totalInsTimeMils+ (begin-millis());
                   avgInsTimeMils = totalInsTimeMils / i;
                   //st.put(keys[rand], i);
                   if (debug)
                     println("insert complete");
                   continue;
               }
           
             }
             Boolean notfound = true;
             while(notfound)
             {
               rand = (int)random(255);
               if (tree.selectkey(array[rand])!= null)
               {
                 if(debug)
                 println("search");
                notfound = false;
                  begin = millis();
                 tree.select(array[rand]);
                 totalSearchTimeMils = totalSearchTimeMils+ (begin - millis());
                   avgSearchTimeMils = totalSearchTimeMils / i;
               }
              
             }
             notfound = true;
         if (debug)    println("delete insert complete");
  background(255);
    textFont(f,24);
  fill(0);
  avg = avg + tree.height()+1;
  itteration++;
  if (max < tree.height()+1) {max = tree.height()+1;}
 text("N =" + tree.size(),15,20);
 text("Max = " + (tree.height()+1),15,40);
 text("Avg = "+ (avg/itteration),15,60);
 text("Opt = 7",15,80);
 text("Root Key = " + tree.myRoot().key,15,100);
 text("Root Value = " + tree.myRoot().val,15,120);
 text("Avg Del = " + avgDelTimeMils,15,140);
 text("Avg Ins = " + avgInsTimeMils,15,160);
 text("Avg Search = " + totalSearchTimeMils,15,180);
  //background(#AAFFEE);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  //println(a);
  theta = radians(40);
  
  //println (theta);
  //println("root : " + tree.myRoot().key);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  ellipse(0, 0, 8, 8);
  // Start the recursive branching!
//  println("Start");
  tree.setCursor();
  branch(320, tree, tree.level(tree.myRoot()));
 // println("end");
 if (outputImage)
 {
  if (bInsert && bDelete && bBalance)
  saveFrame(deleteSaveDir);
  if (bInsert && bDelete && !bBalance)
  saveFrame(deleteSaveNoBalance);
  else  if (bDelete)
  saveFrame(DeleteOnly);
  else if (bInsert && !bBalance)
  saveFrame(InsertNoBalance);
  else if (bInsert && bBalance)
  saveFrame(InsertWBalance);
  else if (!bBalance)
  saveFrame(NoBalance);
  else if (bBalance)
  saveFrame(BalanceOnly);
 }
 
  
  
}
PFont f;

float Htree = 1.568342;

void branch(float h,BST tree, int level) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.666;
 // println(debth);
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
 // println(level);
  if (level >-1 )
  {
   
  if (h > 2) {
  //  println(h);
    
    if (tree.getPosition(true)) // if there is a node to the right
    {
    //  println("right");
      pushMatrix();    // Save the current state of transformation (i.e. where are we now)
      stroke(255,0,0);
      rotate(theta);   // Rotate by theta
      line(0, 0, 0, -h);  // Draw the branch
      translate(0, -h); // Move to the end of the branch
      ellipse(0, 0, 8, 8);
      tree.traverse(true);
      branch(h,tree,tree.cursorLevel());       // Ok, now call myself to draw two new branches!!
       tree.reverse();
      popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    }
    
    
    // Repeat the same thing, only branch off to the "left" this time!
   
    
    if(tree.getPosition(false))//if there is a tree to the left
    {
    //  println("left");
      pushMatrix();
      stroke(0,0,255);
     // tree.traverse(false);
      rotate(-theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      ellipse(0, 0, 8, 8);
      tree.traverse(false);//traverse left
      branch(h,tree,tree.cursorLevel());
       tree.reverse();
      popMatrix();
    }
    
    
  }
 
  }
}


import java.util.NoSuchElementException;
//import java.util.Queue;
//import Queue2;

public static class BST<Key extends Comparable<Key>, Value> {
 //  public Node cursor;
 double log2 = Math.log(2);
    public Node root;             // root of BST the tree and itterate
    public Boolean EnableInsert = false;
    public Boolean EnableDel = false;
    public Boolean EnableBalance = false;
    public Boolean xDebug = false;
    public class Node {
        public Key key;           // sorted by key
        public Value val;         // associated data
        private Node left, right;  // left and right subtrees
        public int N;             // number of nodes in subtree
        public int L;          // level of node

        public Node(Key key, Value val, int N) {
            this.key = key;
            this.val = val;
            this.N = N;
            this.L = 0;
        }
    }
    
    public void setBalance(boolean enable)
{
  EnableBalance = enable;
}
    
    public int cursorLevel()
    {
     // println(cursor.key);
      if (cursor == null) return 0;
      return cursor.L;
    }
    private void setCursor()
    {
      cursor = root;
    }
     private boolean getPosition (boolean right)
    {
      if (cursor == null)
        cursor = root;
      if (right)
        return (cursor.right !=null);
      else
        return (cursor.left !=null);
    }
    
    public boolean traverse(boolean right)
    {
      if (right)
      {
        cursor = cursor.right;
      }
      else
      {
         cursor = cursor.left;
      }
      return true;
    }
    public String selectkey(Key key)
    {
      Node x = select(key);
      if (x!=null)
        return "found";
      return null;
    }
    public Node select(Key key)
    {
      return select(root,key);
    }
    
      private Node select(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) return select(x.left, key);
        else if (cmp > 0) return select(x.right, key);
        else              return x;
    }
    Node cursor;
    public Node parent(Key key)
    {
    //  println("Current: " + key);
      curparent = root;
       // println("parent: " + curparent.key);
        curparent= parent(root,key);
     //   println("parent: " + curparent.key);
        return curparent;
    }
    Node curparent = null;
    public Node parent(Node x, Key key)
    {
    //  println("search :" + x.key);
      if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) {curparent = x;
      return parent(x.left, key);}
        else if (cmp > 0) {curparent = x;
      return parent(x.right, key);}
        else             {//println("found parent:" + x.key);
      return curparent;}
    }
    
    //bring the cursor back one node.
    public void reverse()
    {
      cursor = parent(cursor.key);
      curparent = null;
    }
       
    
    public void setInsert(Boolean Enable)
    {
      EnableInsert = Enable;
    }
    public void setDelete(Boolean Enable)
    {
      EnableDel = Enable;
    }
  public void setDebug(Boolean Enable)
  {
    xDebug = Enable;
  }
    
    public Node myRoot(){
      return root;
    }
    // is the symbol table empty?
    public boolean isEmpty() {
        return size() == 0;
    }

    // return number of key-value pairs in BST
    public int size() {
        
      return size(root);
        
    }

    // return number of key-value pairs in BST rooted at x
    private int size(Node x) {
        if (x == null) return 0;
        else 
        
        return x.N;
        
    }
    public int level(Node x){
      if (x == null) return -1;
        else return x.L;
    }
    
    public int debthleft(Node x, int debth)
    {
      if (debth == 0) debth = 1;
      else debth = debth +1;
      if (x==null)x=root;
      if (x.left!=null) debth = debthleft(x.left,debth);
      return debth;
    }
    public int debthright(Node x, int debth)
    {
      if (debth == 0) debth = 1;
      else debth = debth +1;
      if (x==null)x=root;
      if (x.right!=null)debth = debthright(x.right,debth);
      return debth;
    }
    
    public int nodesRight()
    {
      return size(root.right);
    }
    
    public int nodesLeft()
    {
      return size(root.left);
    }
   /***********************************************************************
    *  Search BST for given key, and return associated value if found,
    *  return null if not found
    ***********************************************************************/
    // does there exist a key-value pair with given key?
    public boolean contains(Key key) {
        return get(key) != null;
    }

    // return value associated with the given key, or null if no such key exists
    public Value get(Key key) {
        return get(root, key);
    }

    private Value get(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) return get(x.left, key);
        else if (cmp > 0) return get(x.right, key);
        else              return x.val;
    }

   /***********************************************************************
    *  Insert key-value pair into BST
    *  If key already exists, update with new value
    ***********************************************************************/
    public void put(Key key, Value val) {
    //  println(key);
        if (val == null) { delete(key); return; }
        root = put(root, key, val);
        assert check();
       
    }
  
    public Node putMax(Node x, Node insert)
    {
      if (x == null) x=insert;
      else
      {
       //the inserted node is larger than current node.
      if(insert.key.compareTo(x.key)<0) 
      {
        insert.left = x;
        x = insert;
      }
      else      
      {
        x.right = putMax(x.right, insert);
        //we just instered something to right
        if (x.left == null && x.right.left == null)
          {
            Node t = x.right;
            x.right = null;
            x.N = 1 + size(x.left) + size(x.right);
            x.L = ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
            t.left = x;
            x = t;
          }
      }   
      }
      x.N = 1 + size(x.left) + size(x.right);
      x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
      return x; 
    }
    
    public Node putMin(Node x, Node insert)
    {
     if(x == null) x=insert;
     else
     {
     //the current node is less than what is being inserted.
     if(insert.key.compareTo(x.key)>0)
     {
        insert.right = x;
        x = insert;
        //return insert;
     }
     else
     {
      x.left = putMin(x.left, insert);
      if (x.right == null && x.left.right == null)
        {
          Node t = x.left;
          x.left = null;
          x.N = 1 + size(x.left) + size(x.right);
          x.L = ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
          t.right = x;
          x=t;
        }
     }
     }
     x.N = 1 + size(x.left) + size(x.right);
     x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
     return x; 
    }


    public Node Balance(Node x, Key key){
      
      int cmp = key.compareTo(x.key);
      Node nodeToPromote = null;  

      if (cmp <0 )//left
      {
        if (key.compareTo(x.left.key) <0)
        //parent replace gp
        {  
          if (x.left.right==null)
          {
            nodeToPromote = x.left;
            x.left = null;
            nodeToPromote.right = x;
          }
          else if (x.left.right.right == null && x.left.right.left == null)
          {
            nodeToPromote = x.left.right;
              x.left.right = null;
              nodeToPromote.right = x;
              nodeToPromote.left = x.left;
              x.left = null;
              x.N = 1 + size(x.left) + size(x.right);
              nodeToPromote.left.N = 1 + size(nodeToPromote.left.left) + size(nodeToPromote.left.right);
          }
          else
            return x;
            
        }
        else
        //inserted replace gp
        {
          nodeToPromote = x.left.right;
          x.left.right = null;
          nodeToPromote.right = x;
          nodeToPromote.left = x.left;
        }
        //inserted node is on the left.
        //x.left = Balance(x.left,key);
      }
      
      if (cmp > 0)//right
      {
        if (key.compareTo(x.right.key) < 0)
          //inserted to replace gp
        {  
          nodeToPromote = x.right.left;
          x.right.left = null;
          nodeToPromote.left = x;
          nodeToPromote.right = x.right;
        }
        else
        //parent replace gp
        {
          if (x.right.left==null)
          {
            nodeToPromote = x.right;
            x.right = null;
            nodeToPromote.left = x;
          }
          else if (x.right.left.left == null && x.right.left.right == null)
          {
            nodeToPromote = x.right.left;
              x.right.left = null;
              nodeToPromote.left = x;
              nodeToPromote.right = x.right;
              x.right = null;
              x.N = 1 + size(x.left) + size(x.right);
              nodeToPromote.right.N = 1 + size(nodeToPromote.right.left) + size(nodeToPromote.right.right);
          }
          else
            return x;
        }
      }
      
      x.N = 1 + size(x.left) + size(x.right);
      nodeToPromote.N = 1 + size(nodeToPromote.left) + size(nodeToPromote.right);
      
      return nodeToPromote;
    }
    
    private Node put(Node x, Key key, Value val) {
        if (x == null) return put(new Node(key,val,1),key, val);
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) 
        {  
          if (EnableInsert)//debug to turn on or off change
          {
            if (level(x.left)>level(x.right))
            {
              //insert candidate for current node
              cmp = key.compareTo(max(x.left).key);//Compare the logical successor to the left
              //insert candidate for current node
              if (cmp>0)
              {
                /*
                The node being inserted is the next logical successor.
                Demote the current node and replace it with the node being inserted.
                */
                Node t = x;
                x = new Node(key, val,1);
                x.right = t.right;
                x.left = t.left;
                t.right = null;
                t.left = null;
                x.right = putMin(x.right,t);
                //x.right = put(x.right,t.key,t.val);//standard put would evaluate right node where the result is already known and therefore redundant.
              }
              else if (cmp!=0)
                {
                   x = DemoteRight(x);
                  x.left  = put(x.left,  key, val);
                
                /*
                Node to insert is not the next logical successor 
                Demoting the parent at this point may be benificial.
                Given that we know the left tree is in fact deeper to the right.                
               */
               
              } 
            }
            else
              x.left  = put(x.left,  key, val);//left is = or smaller than the right. continue as normal.
          }
          if(!EnableInsert)//debug to turn on or off change
            x.left  = put(x.left,  key, val);
          x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
          
        }
        else if (cmp > 0) 
        {
          if (EnableInsert)//debug to turn on or off change
          {
            if (level(x.left)<level(x.right))
            {
              cmp = key.compareTo(min(x.right).key);//Compare the logical successor to the right
              //insert candidate for current node
              if (cmp<0)
              {
                   /*
                The node being inserted is the next logical successor.
                Demote the current node and replace it with the node being inserted.
                */
                Node t = x;
                x = new Node(key,val,1);
                x.left = t.left;
                x.right = t.right;
                t.right = null;
                t.left = null;
                x.left = putMax(x.left,t);
                //x.left = put(x.left,t.key,t.val);//standard put would evaluate right node where the result is already known and therefore redundant.
              }
              else if (cmp!=0)
                {
                     x = DemoteLeft(x);
                  x.right = put(x.right, key, val);
                /*
                Node to insert is not the next logical successor 
                Demoting the parent at this point may be benificial.
                Given that we know the left tree is in fact deeper to the left.                
               */
               
                } 
            }
            else
              x.right = put(x.right, key, val);//left is = or smaller than the right. continue as normal.
          }
          
          if(!EnableInsert)//debug to turn on or off change
            x.right = put(x.right, key, val);
          x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
          
        }
        else              
          {
          x.val   = val;
          }
        
        x.N = 1 + size(x.left) + size(x.right);
         if (level(x.left)>level(x.right)
            &&
            Math.ceil(Math.log(x.N)/log2) < x.L)
          x = Bal(x);
        return x;
    }
    
    
    private Node DemoteRight(Node x)
    {
     //Demote current node to the Right tree.
        Node t = x;
        x = max(x.left);
        x.left= deleteMax(t.left); 
        x.right = t.right;
        t.left = t.right = null;
        t.L = 0;
        t.N = 1;
        x.right = putMin(x.right,t); 
        x.N = 1 + size(x.left) + size(x.right);
        x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
        return x; 
    }
    private Node DemoteLeft(Node x)
    {
       //Demote the current node to the left.
        Node t = x;
        x = min(x.right);
        x.right= deleteMin(t.right); 
        x.left = t.left;
        t.left = t.right = null;
        t.L = 0;
        t.N = 1;
        x.left = putMax(x.left,t);
        x.N = 1 + size(x.left) + size(x.right);
        x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
        return x;
    }
    
    private Node recalcToRoot(Node x, Key key, Value val)
    {
      int cmp = key.compareTo(x.key);
      
      if      (cmp < 0) recalcToRoot(x.left,key,val);
        else if (cmp > 0) recalcToRoot(x.right, key, val);
        //found node work backwards.
    
      x.N = 1 + size(x.left) + size(x.right);
      x.L =  ((level(x.left)>level(x.right))?level(x.left):level(x.right) )+1;
      return x;
    }
   /***********************************************************************
    *  Delete
    ***********************************************************************/

    public void deleteMin() {
        if (isEmpty()) throw new NoSuchElementException("Symbol table underflow");
        root = deleteMin(root);
        assert check();
    }

    private Node deleteMin(Node x) {
        if (x.left == null) return x.right;
        x.left = deleteMin(x.left);
        x.N = size(x.left) + size(x.right) + 1;
        x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;

        return x;
    }

    public void deleteMax() {
        if (isEmpty()) throw new NoSuchElementException("Symbol table underflow");
        root = deleteMax(root);
        assert check();
    }

    private Node deleteMax(Node x) {
        if (x.right == null) return x.left;
        x.right = deleteMax(x.right);
        x.N = size(x.left) + size(x.right) + 1;
        x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
      
        return x;
    }
    
    private Node deleteLowestNode(Node x, Boolean bMax)
    {
      if (x == null) return x;
      if (level(x.left)>level(x.right)) return deleteLowestNode(x.left, bMax);
      if (level(x.left)<level(x.right)) return deleteLowestNode(x.right,bMax);
      if (bMax)
        return deleteMax(x);
      else
        return deleteMin(x);
    }

    
  public void delete(Key key) {
      
      ///Node deleted = null;
  
        root = delete(root, key);
     
    }
  
  
  private Node putBack(Node x, Node source)
    {
       if (x == null)
         {
         source.L = 0;
         source.N = 1;
         return source;
         }
         int cmp = source.key.compareTo(x.key);
         if      (cmp < 0) 
         {  
           if (level(x.left)>level(x.right))
           {
               cmp = source.key.compareTo(max(x.left).key);//Compare the logical successor to the left
              //insert candidate for current node
              if (cmp>0)
              {
                /*
                The node being inserted is the next logical successor.
                Demote the current node and replace it with the node being inserted.
                */
                Node t = x;
                x = source;
                x.right = t.right;
                x.left = t.left;
                t.right = null;
                t.left = null;
                x.right = putMin(x.right,t);
                //x.right = put(x.right,t.key,t.val);//standard put would evaluate right node where the result is already known and therefore redundant.
              }
              else
               x.left  = putBack(x.left,  source);
           }
           else if(cmp!=0)
             x.left  = putBack(x.left,  source);
         }
         else if (cmp > 0) 
         {
           if (level(x.left)<level(x.right))
           {
               cmp = source.key.compareTo(min(x.right).key);//Compare the logical successor to the right
              //insert candidate for current node
              if (cmp<0)
              {
                   /*
                The node being inserted is the next logical successor.
                Demote the current node and replace it with the node being inserted.
                */
                Node t = x;
                x = source;
                x.left = t.left;
                x.right = t.right;
                t.right = null;
                t.left = null;
                x.left = putMax(x.left,t);
                //x.left = put(x.left,t.key,t.val);//standard put would evaluate right node where the result is already known and therefore redundant.
              }
              else if(cmp!=0)
             x.right = putBack(x.right, source);
           }
           else 
             x.right = putBack(x.right, source);
         }
         x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
         x.N = 1 + size(x.left) + size(x.right);
         return x;
    }
  
 

private Node Bal(Node x)
{
  if (!EnableDel)return x;
  //No need to look if the height < 2
  if (x.L < 2) return x;
  
  if (Math.ceil(Math.log(x.N)/log2)<x.L)
  {

    // If the difference between the right tree and left is > 1 levels
    //and the height of the right tree is larger than ideal
    
    if((level(x.left) - level(x.right)) < 0)
    {
      if(  Math.ceil(Math.log(size(x.right))/log2)<level(x.right))
      {
        //Shift a node from the right tree
          Node t = x;
            x = min(x.right);
            x.right= deleteMin(t.right); 
             x.left = t.left;
             t.left = t.right = null;
             x.left =  putBack(x.left,t);
      }
    }
    
    //If the difference between the left and the right is > 1 level
    //and the height of the left tree is larger than ideal
    else if ((level(x.left) - level(x.right)>0))
    {
      if(Math.ceil(Math.log(size(x.left))/log2)<level(x.left))
      {
        //shift a node from the left tree
          Node t = x;
          x = max(x.left);
          x.left= deleteMax(t.left); 
          x.right = t.right;
          t.left = t.right = null;
           x.right =  putBack(x.right,t);
      
      }
    }
  }
  
  //update the level
  x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
  x.N = 1 + size(x.left) + size(x.right);
  return x;
}
private Node delete(Node x, Key key) {
  if (xDebug)
  println(key);
    if (x == null) return null;
    int cmp = key.compareTo(x.key);
    //first node or we have not yet found the node
    if (cmp < 0)       x.left  = delete(x.left, key);
      
    else if (cmp > 0) x.right = delete(x.right, key);
    
    else { 
      if (x.right == null) return x.left;
      if (x.left  == null) return x.right;

      //if the left tree height is greater than the right
      //and the left is larger than it should be
      Boolean dir = (level(x.left) >level(x.right)
          &&
          Math.ceil(Math.log(size(x.left))/log2)+1 < level(x.left));
      if(EnableDel)
      {
        dir = !dir;
        Node t = x;
        x = dir? min(t.right): max(t.left);
        if (dir)
          x.right = deleteMin(t.right); 
        else
          x.left = deleteMax(t.left);
        
        if (dir)
          x.left = t.left;
        else 
          x.right = t.right;
      }
      else
      {
        Node t = x;
        x = min(t.right);
        x.right = deleteMin(t.right); 
        x.left = t.left;
      }
      
    }
    
    if (level(x.left)>level(x.right))
      x = DemoteRight(x);
    else if (level(x.left)<level(x.right))
       x = DemoteLeft(x);
     
     
    x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
    x.N = size(x.left) + size(x.right) + 1;
   
      x = Bal(x);
    return x;
} 

   /***********************************************************************
    *  Min, max, floor, lowestNode and ceiling
    ***********************************************************************/
    public Key min() {
        if (isEmpty()) return null;
        return min(root).key;
    } 

    private Node min(Node x) { 
        if (x.left == null) return x; 
        else                return min(x.left); 
    } 

    private Node lowestNode(Node x, Boolean bMax)
    {
      if (level(x.left)>level(x.right)) return lowestNode(x.left, bMax);
      if (level(x.left)<level(x.right)) return lowestNode(x.right,bMax);
      if (bMax)
        return max(x);
      else
        return min(x);
    }
    
    
    public Key max() {
        if (isEmpty()) return null;
        return max(root).key;
    } 

    private Node max(Node x) { 
        if (x.right == null) return x; 
        else                 return max(x.right); 
    } 

    public Key floor(Key key) {
        Node x = floor(root, key);
        if (x == null) return null;
        else return x.key;
    } 

    private Node floor(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if (cmp == 0) return x;
        if (cmp <  0) return floor(x.left, key);
        Node t = floor(x.right, key); 
        if (t != null) return t;
        else return x; 
    } 

    public Key ceiling(Key key) {
        Node x = ceiling(root, key);
        if (x == null) return null;
        else return x.key;
    }

    private Node ceiling(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if (cmp == 0) return x;
        if (cmp < 0) { 
            Node t = ceiling(x.left, key); 
            if (t != null) return t;
            else return x; 
        } 
        return ceiling(x.right, key); 
    } 

   /***********************************************************************
    *  Rank and selection
    ***********************************************************************/
    public Key select(int k) {
        if (k < 0 || k >= size())  return null;
        Node x = select(root, k);
        return x.key;
    }

    // Return key of rank k. 
    private Node select(Node x, int k) {
        if (x == null) return null; 
        int t = size(x.left); 
        if      (t > k) return select(x.left,  k); 
        else if (t < k) return select(x.right, k-t-1); 
        else            return x; 
    } 

    public int rank(Key key) {
        return rank(key, root);
    } 

    // Number of keys in the subtree less than key.
    private int rank(Key key, Node x) {
      
        if (x == null) return 0; 
        int cmp = key.compareTo(x.key); 
        if      (cmp < 0) return rank(key, x.left); 
        else if (cmp > 0) return 1 + size(x.left) + rank(key, x.right); 
        else              return size(x.left); 
    } 

   /***********************************************************************
    *  Range count and range search.
    ***********************************************************************/
    public Iterable<Key> keys() {
        return keys(min(), max());
    }

    public Iterable<Key> keys(Key lo, Key hi) {
        Queue<Key> queue = new Queue<Key>();
        keys(root, queue, lo, hi);
        return queue;
    } 


    private void keys(Node x, Queue<Key> queue, Key lo, Key hi) { 
        if (x == null) return; 
        int cmplo = lo.compareTo(x.key); 
        int cmphi = hi.compareTo(x.key); 
        if (cmplo < 0) keys(x.left, queue, lo, hi); 
        if (cmplo <= 0 && cmphi >= 0) queue.enqueue(x.key); 
        if (cmphi > 0) keys(x.right, queue, lo, hi); 
    } 
    
    
    public int size(Key lo, Key hi) {
        if (lo.compareTo(hi) > 0) return 0;
        if (contains(hi)) return rank(hi) - rank(lo) + 1;
        else              return rank(hi) - rank(lo);
    }


    // height of this BST (one-node tree has height 0)
    public int height() { return height(root); }
    private int height(Node x) {
        if (x == null) return -1;
        return 1 + Math.max(height(x.left), height(x.right));
    }
    
    public Key LowestNodeMax()
    {
      return lowestNode(root,true).key;
    }
    public Key LowestNodeMin()
    {
      return lowestNode(root,false).key;
    }


    // level order traversal
    public Iterable<Key> levelOrder() {
        Queue<Key> keys = new Queue<Key>();
        Queue<Node> queue = new Queue<Node>();
        queue.enqueue(root);
        while (!queue.isEmpty()) {
            Node x = queue.dequeue();
            if (x == null) continue;
            keys.enqueue(x.key);
            queue.enqueue(x.left);
            queue.enqueue(x.right);
        }
        return keys;
    }

  /*************************************************************************
    *  Check integrity of BST data structure
    *************************************************************************/
    public boolean check() {
        if (!isBST())            System.out.println("Not in symmetric order");
        if (!isSizeConsistent()) System.out.println("Subtree counts not consistent");
        if (!isRankConsistent()) System.out.println("Ranks not consistent");
        return isBST() && isSizeConsistent() && isRankConsistent();
    }

    // does this binary tree satisfy symmetric order?
    // Note: this test also ensures that data structure is a binary tree since order is strict
    private boolean isBST() {
        return isBST(root, null, null);
    }

    // is the tree rooted at x a BST with all keys strictly between min and max
    // (if min or max is null, treat as empty constraint)
    // Credit: Bob Dondero's elegant solution
    public boolean isBST(Node x, Key min, Key max) {
        if (x == null) return true;
        if (min != null && x.key.compareTo(min) <= 0) return false;
        if (max != null && x.key.compareTo(max) >= 0) return false;
        return isBST(x.left, min, x.key) && isBST(x.right, x.key, max);
    } 

    // are the size fields correct?
    public boolean isSizeConsistent() { return isSizeConsistent(root); }
    private boolean isSizeConsistent(Node x) {
        if (x == null) return true;
        if (x.N != size(x.left) + size(x.right) + 1) return false;
        return isSizeConsistent(x.left) && isSizeConsistent(x.right);
    } 
    public int debth = 1;
    // check that ranks are consistent
    public boolean isRankConsistent() {
      debth = 1;
        for (int i = 0; i < size(); i++)
            if (i != rank(select(i))) return false;
        for (Key key : keys())
            if (key.compareTo(select(rank(key))) != 0) return false;
        return true;
    }


    /*****************************************************************************
     *  Test client
     *****************************************************************************/
  /*   public static void main(String[] args) { 
         BST<String, Integer> st = new BST<String, Integer>();
         for (int i = 0; !StdIn.isEmpty(); i++) {
             String key = StdIn.readString();
             st.put(key, i);
         }

         for (String s : st.levelOrder())
             StdOut.println(s + " " + st.get(s));

         StdOut.println();

         for (String s : st.keys())
             StdOut.println(s + " " + st.get(s));
     }*/
}



//package pkg;


/*************************************************************************
 *  Compilation:  javac Queue.java
 *  Execution:    java Queue < input.txt
 *  Data files:   http://algs4.cs.princeton.edu/13stacks/tobe.txt  
 *
 *  A generic queue, implemented using a linked list.
 *
 *  % java Queue < tobe.txt 
 *  to be or not to be (2 left on queue)
 *
 *************************************************************************/

import java.util.Iterator;
import java.util.NoSuchElementException;

/**
 *  The <tt>Queue</tt> class represents a first-in-first-out (FIFO)
 *  queue of generic items.
 *  It supports the usual <em>enqueue</em> and <em>dequeue</em>
 *  operations, along with methods for peeking at the first item,
 *  testing if the queue is empty, and iterating through
 *  the items in FIFO order.
 *  <p>
 *  This implementation uses a singly-linked list with a static nested class for
 *  linked-list nodes. See {@link LinkedQueue} for the version from the
 *  textbook that uses a non-static nested class.
 *  The <em>enqueue</em>, <em>dequeue</em>, <em>peek</em>, <em>size</em>, and <em>is-empty</em>
 *  operations all take constant time in the worst case.
 *  <p>
 *  For additional documentation, see <a href="http://algs4.cs.princeton.edu/13stacks">Section 1.3</a> of
 *  <i>Algorithms, 4th Edition</i> by Robert Sedgewick and Kevin Wayne.
 *
 *  @author Robert Sedgewick
 *  @author Kevin Wayne
 */
public static class Queue<Item> implements Iterable<Item> {
    private int N;               // number of elements on queue
    private Node<Item> first;    // beginning of queue
    private Node<Item> last;     // end of queue

    // helper linked list class
    private static class Node<Item> {
        private Item item;
        private Node<Item> next;
    }

    /**
     * Initializes an empty queue.
     */
    public Queue() {
        first = null;
        last  = null;
        N = 0;
    }

    /**
     * Is this queue empty?
     * @return true if this queue is empty; false otherwise
     */
    public boolean isEmpty() {
        return first == null;
    }

    /**
     * Returns the number of items in this queue.
     * @return the number of items in this queue
     */
    public int size() {
        return N;     
    }

    /**
     * Returns the item least recently added to this queue.
     * @return the item least recently added to this queue
     * @throws java.util.NoSuchElementException if this queue is empty
     */
    public Item peek() {
        if (isEmpty()) throw new NoSuchElementException("Queue underflow");
        return first.item;
    }

    /**
     * Adds the item to this queue.
     * @param item the item to add
     */
    public void enqueue(Item item) {
        Node<Item> oldlast = last;
        last = new Node<Item>();
        last.item = item;
        last.next = null;
        if (isEmpty()) first = last;
        else           oldlast.next = last;
        N++;
    }

    /**
     * Removes and returns the item on this queue that was least recently added.
     * @return the item on this queue that was least recently added
     * @throws java.util.NoSuchElementException if this queue is empty
     */
    public Item dequeue() {
        if (isEmpty()) throw new NoSuchElementException("Queue underflow");
        Item item = first.item;
        first = first.next;
        N--;
        if (isEmpty()) last = null;   // to avoid loitering
        return item;
    }

    /**
     * Returns a string representation of this queue.
     * @return the sequence of items in FIFO order, separated by spaces
     */
    public String toString() {
        StringBuilder s = new StringBuilder();
        for (Item item : this)
            s.append(item + " ");
        return s.toString();
    } 

    /**
     * Returns an iterator that iterates over the items in this queue in FIFO order.
     * @return an iterator that iterates over the items in this queue in FIFO order
     */
    public Iterator<Item> iterator()  {
        return new ListIterator<Item>(first);  
    }

    // an iterator, doesn't implement remove() since it's optional
    private class ListIterator<Item> implements Iterator<Item> {
        private Node<Item> current;

        public ListIterator(Node<Item> first) {
            current = first;
        }

        public boolean hasNext()  { return current != null;                     }
        public void remove()      { throw new UnsupportedOperationException();  }

        public Item next() {
            if (!hasNext()) throw new NoSuchElementException();
            Item item = current.item;
            current = current.next; 
            return item;
        }
    }


    /**
     * Unit tests the <tt>Queue</tt> data type.
     */
   /* public static void main(String[] args) {
        Queue<String> q = new Queue<String>();
        while (!StdIn.isEmpty()) {
            String item = StdIn.readString();
            if (!item.equals("-")) q.enqueue(item);
            else if (!q.isEmpty()) StdOut.print(q.dequeue() + " ");
        }
        StdOut.println("(" + q.size() + " left on queue)");
    }*/
}


//package pkg;

/*************************************************************************
 *  Compilation:  javac BST.java
 *  Execution:    java BST
 *  Dependencies: StdIn.java StdOut.java  
 *  Data files:   http://algs4.cs.princeton.edu/32bst/tinyST.txt  
 *
 *  A symbol table implemented with a binary search tree.
 * 
 *  % more tinyST.txt
 *  S E A R C H E X A M P L E
 *  
 *  % java BST < tinyST.txt
 *  A 8
 *  C 4
 *  E 12
 *  H 5
 *  L 11
 *  M 9
 *  P 10
 *  R 3
 *  S 0
 *  X 7
 *
 *************************************************************************/

