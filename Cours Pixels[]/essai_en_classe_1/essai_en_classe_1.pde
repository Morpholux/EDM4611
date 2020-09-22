color c = color(unbinary("01001111"), unbinary("11001111"), unbinary("00011111"), unbinary("11111111"));

background(c);

println(c);

println(red(c));
println(green(c));
println(blue(c));
println(alpha(c));

// Bit shifting et bit masking
println((c >> 16) & 0xFF);


color c2 = 255 << 24 | 79 << 16 | 207 << 8 | 31 ;
//color c2 = 0xFF000000 | 79 << 16 | 207 << 8 | 31 ;
println(binary(int(alpha(c2))));

fill(c2);
stroke(255);
rect(25,25,50,50);

int entierPos = 2147483647;
int entierNeg = -2147483648;
