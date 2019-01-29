class spl
{
	public static void main(String[] args) {
		String s="123;456;789";
		String[] sp=s.split(";");
		int i = 0;
		boolean flag;
		if(sp[i]!=null)	flag=true;
		else 	flag = false;
		while(flag&&!sp[i].equals(""))
		{
			System.out.println(sp[i]+"\t");
			i++;

			if(i<sp.length&&sp[i]!=null)	flag=true;
			else 	flag = false;
		}
	}
}