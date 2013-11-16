
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

import java.util.NoSuchElementException;

public class BST<Key extends Comparable<Key>, Value> {
    private Node root;             // root of BST
	double log2 = Math.log(2);		// log2
	
	/* Controls to enable and disable changes.*/
	public Boolean EnableInsert = true;
    public Boolean EnableDel = true;
    public Boolean EnableBalance = true;
	
	
    private class Node {
        private Key key;           // sorted by key
        private Value val;         // associated data
        private Node left, right;  // left and right subtrees
        private int N;             // number of nodes in subtree
		private int L;

        public Node(Key key, Value val, int N) {
            this.key = key;
            this.val = val;
            this.N = N;
			this.L = 0;
        }
    }
	
	 /***************
     * debug flags 
     * *********/
     
    public void setInsert(Boolean Enable)
    {
    	EnableInsert = Enable;
    }
    public void setDelete(Boolean Enable)
    {
    	EnableDel = Enable;
    }
    public void setBalance(Boolean Enable)
    {
    	EnableBalance = Enable;
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
        else return x.N;
    }
	//return the height of the current node. 
	//0 = no nodes under current node. 
	public int level(Node x){
    	if (x == null) return -1;
        else return x.L;
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
        if (val == null) { delete(key); return; }
        root = put(root, key, val);
        assert check();
    }

    private Node put(Node x, Key key, Value val) {
        if (x == null) return new Node(key, val, 1);
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) 
		{
			if (level(x.left)>level(x.right)
			&& EnableInsert)// if feature is turned off this will always drop out to normal operation
        	{
				//insert candidate for current node
        		cmp = key.compareTo(max(x.left).key);
				if (cmp>0)
        		{
					//Node to be inserted is the next logical candidate for succession
					Node t = x;
					x = new Node(key, val,1);
					x.right = t.right;
					x.left = t.left;
					t.right = null;
					t.left = null;
					//send the current node to the right
        			x.right = putMin(x.right,t);
				}
				else if(cmp!=0)//if cmp is 0 node is duplicate cut your losses
				{
					x = DemoteRight(x);
					x.left  = put(x.left,  key, val);
				}
			}
			else
        		x.left  = put(x.left,  key, val);
			x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
		}
        else if (cmp > 0) 
		{
			if (level(x.left)<level(x.right)
			&& EnableInsert)// if feature is turned off this will always drop out to normal operation
        	{
				//insert candidate for current node
				cmp = key.compareTo(min(x.right).key);
				if (cmp<0)
        		{
					//Node to be inserted is the next logical candidate for succession
					Node t = x;
					x = new Node(key,val,1);
					x.left = t.left;
					x.right = t.right;
					t.right = null;
					t.left = null;
					//send the current node to the left.
					x.left = putMax(x.left,t);
				}
				else if (cmp!=0)//if cmp is 0 node is duplicate cut your losses
				{
					x = DemoteLeft(x);
					x.right = put(x.right, key, val);
				}
			}
			else
        		x.right = put(x.right, key, val);
			x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
		}
        else              x.val   = val;
		
        x.N = 1 + size(x.left) + size(x.right);
		x = Balance(x);
        return x;
    }
	
	 //used to shift node from left to right or vice versa.
	 //Used in balance method
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
         	x.left  = putBack(x.left,  source);
         }
         else if (cmp > 0) 
         {
         	x.right = putBack(x.right, source);
         }
         x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
         x.N = 1 + size(x.left) + size(x.right);
         return x;
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
		if(x == null) x = insert;
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
	
    private Node DemoteRight(Node x)
    {
     //Demote current node to the Right tree.
        Node t = x;
        x = max(x.left);
        x.left= deleteMax(t.left); 
        x.right = t.right;
        x.N = t.N;
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
        x.N = t.N;
        t.left = t.right = null;
        t.L = 0;
        t.N = 1;
        x.left = putMax(x.left,t); 
	    x.N = 1 + size(x.left) + size(x.right);
	    x.L =  ((level(x.left)>=level(x.right))?level(x.left):level(x.right))+1;
        return x;
    }

    public void delete(Key key) {
        root = delete(root, key);
        assert check();
    }

    private Node delete(Node x, Key key) {
        if (x == null) return null;
        int cmp = key.compareTo(x.key);
        if      (cmp < 0) x.left  = delete(x.left,  key);
        else if (cmp > 0) x.right = delete(x.right, key);
        else { 
            if (x.right == null) return x.left;
            if (x.left  == null) return x.right;
            Node t = x;
			//if the tree on the left is larger Hibbard Delete from the left
			//otherwise delete right.
			boolean dir = (level(x.left)> level(x.right);
			
			if (!EnableDel) dir = true;//if this feature is turned off always delete left.
			
            x = dir ? min(t.right) : max(t.left);
			if (dir)
			{
				x.right = deleteMin(t.right);
				x.left = t.left;
			}
			else
			{
				x.left = deleteMax(t.left);
				x.right = t.right;
			}
        } 
        x.N = size(x.left) + size(x.right) + 1;
		x.L = ((level(x.left)>level(x.right))?level(x.left):level(x.right))+1;
		x = Balance(x);
        return x;
    } 

	
	private Node Balance(Node x)
	{
		if(!EnableBalance) return x; // if this feature is turned off exit.
		if (x.L < 2) return x; // if the node is less than 2 from the floor there is no real gain for balance.
		
		//if the node level is within 1 lvl of proper distribution
		if (Math.ceil(Math.log(x.N)/log2)+1<x.L)
		{
			if((level(x.left) - level(x.right)) < -1)
			{
				if(	Math.ceil(Math.log(size(x.right))/log2)<level(x.right))
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
			else if ((level(x.left) - level(x.right)>1))
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
	
	/***********************************************************************
    *  Min, max, floor, and ceiling
    ***********************************************************************/
    public Key min() {
        if (isEmpty()) return null;
        return min(root).key;
    } 

    private Node min(Node x) { 
        if (x.left == null) return x; 
        else                return min(x.left); 
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
    private boolean check() {
        if (!isBST())            StdOut.println("Not in symmetric order");
        if (!isSizeConsistent()) StdOut.println("Subtree counts not consistent");
        if (!isRankConsistent()) StdOut.println("Ranks not consistent");
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
    private boolean isBST(Node x, Key min, Key max) {
        if (x == null) return true;
        if (min != null && x.key.compareTo(min) <= 0) return false;
        if (max != null && x.key.compareTo(max) >= 0) return false;
        return isBST(x.left, min, x.key) && isBST(x.right, x.key, max);
    } 

    // are the size fields correct?
    private boolean isSizeConsistent() { return isSizeConsistent(root); }
    private boolean isSizeConsistent(Node x) {
        if (x == null) return true;
        if (x.N != size(x.left) + size(x.right) + 1) return false;
        return isSizeConsistent(x.left) && isSizeConsistent(x.right);
    } 

    // check that ranks are consistent
    private boolean isRankConsistent() {
        for (int i = 0; i < size(); i++)
            if (i != rank(select(i))) return false;
        for (Key key : keys())
            if (key.compareTo(select(rank(key))) != 0) return false;
        return true;
    }


   /*****************************************************************************
    *  Test client
    *****************************************************************************/
    public static void main(String[] args) { 
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
    }
}

/*
Copyright © 2002–2010, Robert Sedgewick and Kevin Wayne. 
Last updated: Sat Sep 14 09:12:37 EDT 2013.
*/