from create_github_gist import create_github_gist


def math():
    file_name = "math.md"

    content = r"""
# math

**The Cauchy-Schwarz Inequality**

$$
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
$$

"""
    return create_github_gist(file_name, content)


if __name__ == "__main__":
    print(f"[gist](https://gist.github.com/{math()})")
