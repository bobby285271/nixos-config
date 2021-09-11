#if 0
    g++ -std=c++14 -O2 -Wall -lm "$0" && ./a.out && rm a.out
    exit
#endif

// You won't need this.

#include <iostream>
#include <map>
#include <vector>
#include <string>

std::map<std::string, std::vector<std::string>> mp;
const int LINE = 33;
const int INDCNT = 6;

std::string getprefix(int indcnt)
{
    std::string ret;
    while (indcnt--)
    {
        ret += ' ';
    }
    return ret;
}

int main()
{
    for (int i = 0; i < LINE; i++)
    {
        std::string k, v;
        std::cin >> k >> v;
        mp[k].push_back(v);
    }
    for (auto k : mp)
    {
        std::cout << getprefix(INDCNT) << "\"" << k.first << "\" = [";
        if (k.second.size() == 1)
        {
            std::cout << " \"" << k.second[0] << "\" ];" << std::endl;
        }
        else
        {
            std::cout << std::endl;
            for (auto v : k.second)
            {
                std::cout << getprefix(INDCNT) << "  \"" << v << "\"" << std::endl;
            }
            std::cout << getprefix(INDCNT) << "];" << std::endl;
        }
    }
}
