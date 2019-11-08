module fourbitcomp(a0, b0, a1, b1, a2, b2, a3, b3, o, xx, xxx);
	input a0, b0, a1, b1, a2, b2, a3, b3;
	output o, xx, xxx;
	
	wire a, b, c, d,e, f, g, h, i, j, k, l, m, n, p, q, r, s, t, u, w, x, y, z, aa, ab;
	
	
	not n0(a, a0);
	not n1(b, b0);
	not n2(c, a1);
	not n3(d, b1);
	not n4(e, a2);
	not n5(f, b2);
	not n6(g, a3);
	not n7(h, b3);
	
	and an0(i, a0, b);
	and an1(j, b0, a);
	and an2(k, a1, d);
	and an3(l, b1, c);
	and an4(m, a2, f);
	and an5(n, b2, e);
	and an6(p, a3, h);
	and an7(q, b3, g);
	
	nor no0(r, i, j);
	nor no1(s, k, l);
	nor no2(t, m, n);
	nor no3(u, p, q);
	
	and bn0(o, r, s, t, u);
	and bn1(w, i, s, t, u);
	and bn2(x, j, s, t, u);
	and bn3(y, k, t, u);
	and bn4(z, l, t, u);
	and bn5(aa, m, u);
	and bn6(ab, n, u);
	
	or or0(xx, w, y, aa, p);
	or or1(xxx, x, z, ab, q);
	
endmodule
	