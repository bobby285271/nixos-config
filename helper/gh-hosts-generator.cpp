#if 0
    clear
    g++ -std=c++14 -O2 -Wall -lm "$0" -o gh-hosts-generator.out && ./gh-hosts-generator.out
    rm -f ./gh-hosts-generator.out
    exit
#endif

// You won't need this.
// https://github.com/521xueweihan/GitHub520

#include <iostream>
#include <map>
#include <vector>
#include <string>

std::map<std::string, std::vector<std::string>> mp;
const int INDCNT = 6;
const int EXTRAINDCNT = 2;

std::string getprefix(int indcnt)
{
    std::string ret;
    while (indcnt--)
    {
        ret += ' ';
    }
    return ret;
}

std::string wrapstring(std::string ori)
{
    std::string ret = "\"" + ori + "\"";
    return ret;
}

int main()
{
    std::cout << "Input raw data:" << std::endl;
    std::string k, v;
    while (std::cin >> k >> v)
    {
        mp[k].push_back(v);
    }
    for (auto &k : mp)
    {
        std::cout << getprefix(INDCNT) << wrapstring(k.first) << " = [";
        if (k.second.size() == 1)
        {
            std::cout << " " << wrapstring(k.second[0]) << " ];" << std::endl;
        }
        else
        {
            std::cout << std::endl;
            for (auto &v : k.second)
            {
                std::cout << getprefix(INDCNT + EXTRAINDCNT) << wrapstring(v) << std::endl;
            }
            std::cout << getprefix(INDCNT) << "];" << std::endl;
        }
    }
    return 0;
}
