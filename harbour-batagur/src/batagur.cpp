/*
 The MIT License (MIT)
 Copyright (c) 2015 toerb
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
#include "batagur.hpp"
#include "sha2.h"
#include "base91.hpp"

using namespace std;

const string batagur(const string master, const string salt, const string token, unsigned int iters, unsigned int start, unsigned int end) {
        if (iters < 1 || start >= end) {
                return "";
        }

        unsigned char d[SHA512_DIGEST_SIZE];

        string init = master + salt + token;

        sha512((unsigned char *) init.c_str(), init.size(), d);

        for (unsigned int i = 1; i < iters; i += 1) {
                sha512(d, SHA512_DIGEST_SIZE, d);
        }

        string b91 = base91::encode(string((char *) d, (size_t) SHA512_DIGEST_SIZE));

        return b91.substr(start, end - start);
}
