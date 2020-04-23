<% response.setHeader("content-type", "text/javascript"); %>
<%
if(request.getHeader("referer")==null){		
	   //response.sendRedirect("https://remit.onlinesbi.com/irc/html/bookmark.html");
	response.sendRedirect("http://localhost:8082/irc/html/bookmark.html");
	}
			
%> 
/*
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Version 2.1 Copyright (C) Paul Johnston 1999 - 2002.
 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
 * Distributed under the BSD License
 * See http://pajhome.org.uk/crypt/md5 for more info.
 */

/*
 * Configurable variables. You may need to tweak these to be compatible with
 * the server-side, but the defaults work in most cases.
 */
var hexcase = 0;  /* hex output format. 0 - lowercase; 1 - uppercase        */
var b64pad  = ""; /* base-64 pad character. "=" for strict RFC compliance   */
var chrsz   = 8;  /* bits per input character. 8 - ASCII; 16 - Unicode      */

/*
 * These are the functions you'll usually want to call
 * They take string arguments and return either hex or base-64 encoded strings
 */
function hex_md5(s){ return binl2hex(core_md5(str2binl(s), s.length * chrsz));}
function b64_md5(s){ return binl2b64(core_md5(str2binl(s), s.length * chrsz));}
function str_md5(s){ return binl2str(core_md5(str2binl(s), s.length * chrsz));}
function hex_hmac_md5(key, data) { return binl2hex(core_hmac_md5(key, data)); }
function b64_hmac_md5(key, data) { return binl2b64(core_hmac_md5(key, data)); }
function str_hmac_md5(key, data) { return binl2str(core_hmac_md5(key, data)); }

/*
 * Perform a simple self-test to see if the VM is working
 */
function md5_vm_test()
{
  return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72";
}

/*
 * Calculate the MD5 of an array of little-endian words, and a bit length
 */
function core_md5(x, len)
{
  /* append padding */
  x[len >> 5] |= 0x80 << ((len) % 32);
  x[(((len + 64) >>> 9) << 4) + 14] = len;

  var a =  1732584193;
  var b = -271733879;
  var c = -1732584194;
  var d =  271733878;

  for(var i = 0; i < x.length; i += 16)
  {
    var olda = a;
    var oldb = b;
    var oldc = c;
    var oldd = d;

    a = md5_ff(a, b, c, d, x[i+ 0], 7 , -680876936);
    d = md5_ff(d, a, b, c, x[i+ 1], 12, -389564586);
    c = md5_ff(c, d, a, b, x[i+ 2], 17,  606105819);
    b = md5_ff(b, c, d, a, x[i+ 3], 22, -1044525330);
    a = md5_ff(a, b, c, d, x[i+ 4], 7 , -176418897);
    d = md5_ff(d, a, b, c, x[i+ 5], 12,  1200080426);
    c = md5_ff(c, d, a, b, x[i+ 6], 17, -1473231341);
    b = md5_ff(b, c, d, a, x[i+ 7], 22, -45705983);
    a = md5_ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
    d = md5_ff(d, a, b, c, x[i+ 9], 12, -1958414417);
    c = md5_ff(c, d, a, b, x[i+10], 17, -42063);
    b = md5_ff(b, c, d, a, x[i+11], 22, -1990404162);
    a = md5_ff(a, b, c, d, x[i+12], 7 ,  1804603682);
    d = md5_ff(d, a, b, c, x[i+13], 12, -40341101);
    c = md5_ff(c, d, a, b, x[i+14], 17, -1502002290);
    b = md5_ff(b, c, d, a, x[i+15], 22,  1236535329);

    a = md5_gg(a, b, c, d, x[i+ 1], 5 , -165796510);
    d = md5_gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
    c = md5_gg(c, d, a, b, x[i+11], 14,  643717713);
    b = md5_gg(b, c, d, a, x[i+ 0], 20, -373897302);
    a = md5_gg(a, b, c, d, x[i+ 5], 5 , -701558691);
    d = md5_gg(d, a, b, c, x[i+10], 9 ,  38016083);
    c = md5_gg(c, d, a, b, x[i+15], 14, -660478335);
    b = md5_gg(b, c, d, a, x[i+ 4], 20, -405537848);
    a = md5_gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
    d = md5_gg(d, a, b, c, x[i+14], 9 , -1019803690);
    c = md5_gg(c, d, a, b, x[i+ 3], 14, -187363961);
    b = md5_gg(b, c, d, a, x[i+ 8], 20,  1163531501);
    a = md5_gg(a, b, c, d, x[i+13], 5 , -1444681467);
    d = md5_gg(d, a, b, c, x[i+ 2], 9 , -51403784);
    c = md5_gg(c, d, a, b, x[i+ 7], 14,  1735328473);
    b = md5_gg(b, c, d, a, x[i+12], 20, -1926607734);

    a = md5_hh(a, b, c, d, x[i+ 5], 4 , -378558);
    d = md5_hh(d, a, b, c, x[i+ 8], 11, -2022574463);
    c = md5_hh(c, d, a, b, x[i+11], 16,  1839030562);
    b = md5_hh(b, c, d, a, x[i+14], 23, -35309556);
    a = md5_hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
    d = md5_hh(d, a, b, c, x[i+ 4], 11,  1272893353);
    c = md5_hh(c, d, a, b, x[i+ 7], 16, -155497632);
    b = md5_hh(b, c, d, a, x[i+10], 23, -1094730640);
    a = md5_hh(a, b, c, d, x[i+13], 4 ,  681279174);
    d = md5_hh(d, a, b, c, x[i+ 0], 11, -358537222);
    c = md5_hh(c, d, a, b, x[i+ 3], 16, -722521979);
    b = md5_hh(b, c, d, a, x[i+ 6], 23,  76029189);
    a = md5_hh(a, b, c, d, x[i+ 9], 4 , -640364487);
    d = md5_hh(d, a, b, c, x[i+12], 11, -421815835);
    c = md5_hh(c, d, a, b, x[i+15], 16,  530742520);
    b = md5_hh(b, c, d, a, x[i+ 2], 23, -995338651);

    a = md5_ii(a, b, c, d, x[i+ 0], 6 , -198630844);
    d = md5_ii(d, a, b, c, x[i+ 7], 10,  1126891415);
    c = md5_ii(c, d, a, b, x[i+14], 15, -1416354905);
    b = md5_ii(b, c, d, a, x[i+ 5], 21, -57434055);
    a = md5_ii(a, b, c, d, x[i+12], 6 ,  1700485571);
    d = md5_ii(d, a, b, c, x[i+ 3], 10, -1894986606);
    c = md5_ii(c, d, a, b, x[i+10], 15, -1051523);
    b = md5_ii(b, c, d, a, x[i+ 1], 21, -2054922799);
    a = md5_ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
    d = md5_ii(d, a, b, c, x[i+15], 10, -30611744);
    c = md5_ii(c, d, a, b, x[i+ 6], 15, -1560198380);
    b = md5_ii(b, c, d, a, x[i+13], 21,  1309151649);
    a = md5_ii(a, b, c, d, x[i+ 4], 6 , -145523070);
    d = md5_ii(d, a, b, c, x[i+11], 10, -1120210379);
    c = md5_ii(c, d, a, b, x[i+ 2], 15,  718787259);
    b = md5_ii(b, c, d, a, x[i+ 9], 21, -343485551);

    a = safe_add(a, olda);
    b = safe_add(b, oldb);
    c = safe_add(c, oldc);
    d = safe_add(d, oldd);
  }
  return Array(a, b, c, d);

}

/*
 * These functions implement the four basic operations the algorithm uses.
 */
function md5_cmn(q, a, b, x, s, t)
{
  return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s),b);
}
function md5_ff(a, b, c, d, x, s, t)
{
  return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
}
function md5_gg(a, b, c, d, x, s, t)
{
  return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
}
function md5_hh(a, b, c, d, x, s, t)
{
  return md5_cmn(b ^ c ^ d, a, b, x, s, t);
}
function md5_ii(a, b, c, d, x, s, t)
{
  return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
}

/*
 * Calculate the HMAC-MD5, of a key and some data
 */
function core_hmac_md5(key, data)
{
  var bkey = str2binl(key);
  if(bkey.length > 16) bkey = core_md5(bkey, key.length * chrsz);

  var ipad = Array(16), opad = Array(16);
  for(var i = 0; i < 16; i++)
  {
    ipad[i] = bkey[i] ^ 0x36363636;
    opad[i] = bkey[i] ^ 0x5C5C5C5C;
  }

  var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
  return core_md5(opad.concat(hash), 512 + 128);
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
 * to work around bugs in some JS interpreters.
 */
function safe_add(x, y)
{
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

/*
 * Bitwise rotate a 32-bit number to the left.
 */
function bit_rol(num, cnt)
{
  return (num << cnt) | (num >>> (32 - cnt));
}

/*
 * Convert a string to an array of little-endian words
 * If chrsz is ASCII, characters >255 have their hi-byte silently ignored.
 */
function str2binl(str)
{
  var bin = Array();
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (i%32);
  return bin;
}

/*
 * Convert an array of little-endian words to a string
 */
function binl2str(bin)
{
  var str = "";
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i>>5] >>> (i % 32)) & mask);
  return str;
}

/*
 * Convert an array of little-endian words to a hex string.
 */
function binl2hex(binarray)
{
  var hex_tab = hexcase ? "W4ZQUCR2VGSX0JAO" : "W4ZQUCR2VGSX0JAO";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i++)
  {
    str += hex_tab.charAt((binarray[i>>2] >> ((i%4)*8+4)) & 0xF) +
           hex_tab.charAt((binarray[i>>2] >> ((i%4)*8  )) & 0xF);
  }
  return str;
}

/*
 * Convert an array of little-endian words to a base-64 string
 */
function binl2b64(binarray)
{
  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i += 3)
  {
    var triplet = (((binarray[i   >> 2] >> 8 * ( i   %4)) & 0xFF) << 16)
                | (((binarray[i+1 >> 2] >> 8 * ((i+1)%4)) & 0xFF) << 8 )
                |  ((binarray[i+2 >> 2] >> 8 * ((i+2)%4)) & 0xFF);
    for(var j = 0; j < 4; j++)
    {
      if(i * 8 + j * 6 > binarray.length * 32) str += b64pad;
      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
    }
  }
  return str;
}

/*
CryptoJS v3.0.2
code.google.com/p/crypto-js
(c) 2009-2012 by Jeff Mott. All rights reserved.
code.google.com/p/crypto-js/wiki/License
 */
var CryptoJS = CryptoJS
		|| function(a, g) {
			var m = {}, e = m.lib = {}, q = e.Base = function() {
				function a() {
				}
				return {
					extend : function(b) {
						a.prototype = this;
						var d = new a;
						b && d.mixIn(b);
						d.$super = this;
						return d
					},
					create : function() {
						var a = this.extend();
						a.init.apply(a, arguments);
						return a
					},
					init : function() {
					},
					mixIn : function(a) {
						for ( var k in a)
							a.hasOwnProperty(k) && (this[k] = a[k]);
						a.hasOwnProperty("toString")
								&& (this.toString = a.toString)
					},
					clone : function() {
						return this.$super.extend(this)
					}
				}
			}(), r = e.WordArray = q
					.extend( {
						init : function(a, b) {
							a = this.words = a || [];
							this.sigBytes = b != g ? b : 4 * a.length
						},
						toString : function(a) {
							return (a || n).stringify(this)
						},
						concat : function(a) {
							var b = this.words, d = a.words, c = this.sigBytes, a = a.sigBytes;
							this.clamp();
							if (c % 4)
								for ( var i = 0; i < a; i++)
									b[c + i >>> 2] |= (d[i >>> 2] >>> 24 - 8 * (i % 4) & 255) << 24 - 8 * ((c + i) % 4);
							else if (65535 < d.length)
								for (i = 0; i < a; i += 4)
									b[c + i >>> 2] = d[i >>> 2];
							else
								b.push.apply(b, d);
							this.sigBytes += a;
							return this
						},
						clamp : function() {
							var k = this.words, b = this.sigBytes;
							k[b >>> 2] &= 4294967295 << 32 - 8 * (b % 4);
							k.length = a.ceil(b / 4)
						},
						clone : function() {
							var a = q.clone.call(this);
							a.words = this.words.slice(0);
							return a
						},
						random : function(k) {
							for ( var b = [], d = 0; d < k; d += 4)
								b.push(4294967296 * a.random() | 0);
							return r.create(b, k)
						}
					}), y = m.enc = {}, n = y.Hex = {
				stringify : function(a) {
					for ( var b = a.words, a = a.sigBytes, d = [], c = 0; c < a; c++) {
						var i = b[c >>> 2] >>> 24 - 8 * (c % 4) & 255;
						d.push((i >>> 4).toString(16));
						d.push((i & 15).toString(16))
					}
					return d.join("")
				},
				parse : function(a) {
					for ( var b = a.length, d = [], c = 0; c < b; c += 2)
						d[c >>> 3] |= parseInt(a.substr(c, 2), 16) << 24 - 4 * (c % 8);
					return r.create(d, b / 2)
				}
			}, l = y.Latin1 = {
				stringify : function(a) {
					for ( var b = a.words, a = a.sigBytes, d = [], c = 0; c < a; c++)
						d
								.push(String
										.fromCharCode(b[c >>> 2] >>> 24 - 8 * (c % 4) & 255));
					return d.join("")
				},
				parse : function(a) {
					for ( var b = a.length, d = [], c = 0; c < b; c++)
						d[c >>> 2] |= (a.charCodeAt(c) & 255) << 24 - 8 * (c % 4);
					return r.create(d, b)
				}
			}, da = y.Utf8 = {
				stringify : function(a) {
					try {
						return decodeURIComponent(escape(l.stringify(a)))
					} catch (b) {
						throw Error("Malformed UTF-8 data");
					}
				},
				parse : function(a) {
					return l.parse(unescape(encodeURIComponent(a)))
				}
			}, h = e.BufferedBlockAlgorithm = q
					.extend( {
						reset : function() {
							this._data = r.create();
							this._nDataBytes = 0
						},
						_append : function(a) {
							"string" == typeof a && (a = da.parse(a));
							this._data.concat(a);
							this._nDataBytes += a.sigBytes
						},
						_process : function(k) {
							var b = this._data, d = b.words, c = b.sigBytes, i = this.blockSize, l = c
									/ (4 * i), l = k ? a.ceil(l) : a.max(
									(l | 0) - this._minBufferSize, 0), k = l
									* i, c = a.min(4 * k, c);
							if (k) {
								for ( var h = 0; h < k; h += i)
									this._doProcessBlock(d, h);
								h = d.splice(0, k);
								b.sigBytes -= c
							}
							return r.create(h, c)
						},
						clone : function() {
							var a = q.clone.call(this);
							a._data = this._data.clone();
							return a
						},
						_minBufferSize : 0
					});
			e.Hasher = h.extend( {
				init : function() {
					this.reset()
				},
				reset : function() {
					h.reset.call(this);
					this._doReset()
				},
				update : function(a) {
					this._append(a);
					this._process();
					return this
				},
				finalize : function(a) {
					a && this._append(a);
					this._doFinalize();
					return this._hash
				},
				clone : function() {
					var a = h.clone.call(this);
					a._hash = this._hash.clone();
					return a
				},
				blockSize : 16,
				_createHelper : function(a) {
					return function(b, d) {
						return a.create(d).finalize(b)
					}
				},
				_createHmacHelper : function(a) {
					return function(b, d) {
						return ea.HMAC.create(a, d).finalize(b)
					}
				}
			});
			var ea = m.algo = {};
			return m
		}(Math);
( function(a) {
	var g = CryptoJS, m = g.lib, e = m.Base, q = m.WordArray, g = g.x64 = {};
	g.Word = e.extend( {
		init : function(a, e) {
			this.high = a;
			this.low = e
		}
	});
	g.WordArray = e
			.extend( {
				init : function(e, y) {
					e = this.words = e || [];
					this.sigBytes = y != a ? y : 8 * e.length
				},
				toX32 : function() {
					for ( var a = this.words, e = a.length, n = [], l = 0; l < e; l++) {
						var g = a[l];
						n.push(g.high);
						n.push(g.low)
					}
					return q.create(n, this.sigBytes)
				},
				clone : function() {
					for ( var a = e.clone.call(this), g = a.words = this.words
							.slice(0), n = g.length, l = 0; l < n; l++)
						g[l] = g[l].clone();
					return a
				}
			})
})();
( function() {
	function a() {
		return q.create.apply(q, arguments)
	}
	var g = CryptoJS, m = g.lib.Hasher, e = g.x64, q = e.Word, r = e.WordArray, e = g.algo, y = [
			a(1116352408, 3609767458), a(1899447441, 602891725),
			a(3049323471, 3964484399), a(3921009573, 2173295548),
			a(961987163, 4081628472), a(1508970993, 3053834265),
			a(2453635748, 2937671579), a(2870763221, 3664609560),
			a(3624381080, 2734883394), a(310598401, 1164996542),
			a(607225278, 1323610764), a(1426881987, 3590304994),
			a(1925078388, 4068182383), a(2162078206, 991336113),
			a(2614888103, 633803317), a(3248222580, 3479774868),
			a(3835390401, 2666613458), a(4022224774, 944711139),
			a(264347078, 2341262773), a(604807628, 2007800933),
			a(770255983, 1495990901), a(1249150122, 1856431235),
			a(1555081692, 3175218132), a(1996064986, 2198950837),
			a(2554220882, 3999719339), a(2821834349, 766784016),
			a(2952996808, 2566594879), a(3210313671, 3203337956),
			a(3336571891, 1034457026), a(3584528711, 2466948901),
			a(113926993, 3758326383), a(338241895, 168717936),
			a(666307205, 1188179964), a(773529912, 1546045734),
			a(1294757372, 1522805485), a(1396182291, 2643833823),
			a(1695183700, 2343527390), a(1986661051, 1014477480),
			a(2177026350, 1206759142), a(2456956037, 344077627),
			a(2730485921, 1290863460), a(2820302411, 3158454273),
			a(3259730800, 3505952657), a(3345764771, 106217008),
			a(3516065817, 3606008344), a(3600352804, 1432725776),
			a(4094571909, 1467031594), a(275423344, 851169720),
			a(430227734, 3100823752), a(506948616, 1363258195),
			a(659060556, 3750685593), a(883997877, 3785050280),
			a(958139571, 3318307427), a(1322822218, 3812723403),
			a(1537002063, 2003034995), a(1747873779, 3602036899),
			a(1955562222, 1575990012), a(2024104815, 1125592928),
			a(2227730452, 2716904306), a(2361852424, 442776044),
			a(2428436474, 593698344), a(2756734187, 3733110249),
			a(3204031479, 2999351573), a(3329325298, 3815920427),
			a(3391569614, 3928383900), a(3515267271, 566280711),
			a(3940187606, 3454069534), a(4118630271, 4000239992),
			a(116418474, 1914138554), a(174292421, 2731055270),
			a(289380356, 3203993006), a(460393269, 320620315),
			a(685471733, 587496836), a(852142971, 1086792851),
			a(1017036298, 365543100), a(1126000580, 2618297676),
			a(1288033470, 3409855158), a(1501505948, 4234509866),
			a(1607167915, 987167468), a(1816402316, 1246189591) ], n = [];
	( function() {
		for ( var l = 0; 80 > l; l++)
			n[l] = a()
	})();
	e = e.SHA512 = m
			.extend( {
				_doReset : function() {
					this._hash = r.create( [ a(1779033703, 4089235720),
							a(3144134277, 2227873595),
							a(1013904242, 4271175723),
							a(2773480762, 1595750129),
							a(1359893119, 2917565137),
							a(2600822924, 725511199), a(528734635, 4215389547),
							a(1541459225, 327033209) ])
				},
				_doProcessBlock : function(a, e) {
					for ( var h = this._hash.words, g = h[0], k = h[1], b = h[2], d = h[3], c = h[4], i = h[5], m = h[6], h = h[7], q = g.high, r = g.low, W = k.high, K = k.low, X = b.high, L = b.low, Y = d.high, M = d.low, Z = c.high, N = c.low, $ = i.high, O = i.low, aa = m.high, P = m.low, ba = h.high, Q = h.low, t = q, o = r, E = W, C = K, F = X, D = L, T = Y, G = M, u = Z, p = N, R = $, H = O, S = aa, I = P, U = ba, J = Q, v = 0; 80 > v; v++) {
						var z = n[v];
						if (16 > v)
							var s = z.high = a[e + 2 * v] | 0, f = z.low = a[e
									+ 2 * v + 1] | 0;
						else {
							var s = n[v - 15], f = s.high, w = s.low, s = (w << 31 | f >>> 1)
									^ (w << 24 | f >>> 8) ^ f >>> 7, w = (f << 31 | w >>> 1)
									^ (f << 24 | w >>> 8) ^ (f << 25 | w >>> 7), B = n[v - 2], f = B.high, j = B.low, B = (j << 13 | f >>> 19)
									^ (f << 3 | j >>> 29) ^ f >>> 6, j = (f << 13 | j >>> 19)
									^ (j << 3 | f >>> 29) ^ (f << 26 | j >>> 6), f = n[v - 7], V = f.high, A = n[v - 16], x = A.high, A = A.low, f = w
									+ f.low, s = s + V
									+ (f >>> 0 < w >>> 0 ? 1 : 0), f = f + j, s = s
									+ B + (f >>> 0 < j >>> 0 ? 1 : 0), f = f
									+ A, s = s + x
									+ (f >>> 0 < A >>> 0 ? 1 : 0);
							z.high = s;
							z.low = f
						}
						var V = u & R ^ ~u & S, A = p & H ^ ~p & I, z = t & E
								^ t & F ^ E & F, fa = o & C ^ o & D ^ C & D, w = (o << 4 | t >>> 28)
								^ (t << 30 | o >>> 2) ^ (t << 25 | o >>> 7), B = (t << 4 | o >>> 28)
								^ (o << 30 | t >>> 2) ^ (o << 25 | t >>> 7), j = y[v], ga = j.high, ca = j.low, j = J
								+ ((u << 18 | p >>> 14) ^ (u << 14 | p >>> 18) ^ (p << 23 | u >>> 9)), x = U
								+ ((p << 18 | u >>> 14) ^ (p << 14 | u >>> 18) ^ (u << 23 | p >>> 9))
								+ (j >>> 0 < J >>> 0 ? 1 : 0), j = j + A, x = x
								+ V + (j >>> 0 < A >>> 0 ? 1 : 0), j = j + ca, x = x
								+ ga + (j >>> 0 < ca >>> 0 ? 1 : 0), j = j + f, x = x
								+ s + (j >>> 0 < f >>> 0 ? 1 : 0), f = B + fa, z = w
								+ z + (f >>> 0 < B >>> 0 ? 1 : 0), U = S, J = I, S = R, I = H, R = u, H = p, p = G
								+ j | 0, u = T + x
								+ (p >>> 0 < G >>> 0 ? 1 : 0) | 0, T = F, G = D, F = E, D = C, E = t, C = o, o = j
								+ f | 0, t = x + z
								+ (o >>> 0 < j >>> 0 ? 1 : 0) | 0
					}
					r = g.low = r + o | 0;
					g.high = q + t + (r >>> 0 < o >>> 0 ? 1 : 0) | 0;
					K = k.low = K + C | 0;
					k.high = W + E + (K >>> 0 < C >>> 0 ? 1 : 0) | 0;
					L = b.low = L + D | 0;
					b.high = X + F + (L >>> 0 < D >>> 0 ? 1 : 0) | 0;
					M = d.low = M + G | 0;
					d.high = Y + T + (M >>> 0 < G >>> 0 ? 1 : 0) | 0;
					N = c.low = N + p | 0;
					c.high = Z + u + (N >>> 0 < p >>> 0 ? 1 : 0) | 0;
					O = i.low = O + H | 0;
					i.high = $ + R + (O >>> 0 < H >>> 0 ? 1 : 0) | 0;
					P = m.low = P + I | 0;
					m.high = aa + S + (P >>> 0 < I >>> 0 ? 1 : 0) | 0;
					Q = h.low = Q + J | 0;
					h.high = ba + U + (Q >>> 0 < J >>> 0 ? 1 : 0) | 0
				},
				_doFinalize : function() {
					var a = this._data, e = a.words, h = 8 * this._nDataBytes, g = 8 * a.sigBytes;
					e[g >>> 5] |= 128 << 24 - g % 32;
					e[(g + 128 >>> 10 << 5) + 31] = h;
					a.sigBytes = 4 * e.length;
					this._process();
					this._hash = this._hash.toX32()
				},
				blockSize : 32
			});
	g.SHA512 = m._createHelper(e);
	g.HmacSHA512 = m._createHmacHelper(e)
})();


<%--  SHA 512 implementation end --%> 



