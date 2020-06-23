#!/usr/bin/python3

import re
import os
import sys
import shutil

project_dir = 'project/'
project_file = "TencentOS_tiny.uvprojx"

def mkdir(path):
    if path == '':
        return
    else:
        folder = os.path.exists(path)
        if not folder:
            os.makedirs(path)

def copy_file(src, dst):
    if os.path.exists(src):
        shutil.copyfile(src, dst)
        print("cp " + src + " " + dst)

def copy_file_dir(src_dir, dst_dir):
    shutil.copyfile(src_dir, dst_dir)
    print("cp " + src_dir + " " + dst_dir)

def copy_and_overwrite(from_path, to_path):
    if os.path.exists(to_path):
        shutil.rmtree(to_path)
    if os.path.exists(from_path):
        shutil.copytree(from_path, to_path)
        print("cp " + from_path + " " + to_path)


def replace_src_file_path(line, dir = project_dir):
    find_src_file_path = ''
    copy_src_file_path = ''
    copy_src_file_dir = ''
    # 找到文件路径
    list = re.findall(r"<FilePath>(.+?)</FilePath>", line)
    find_src_file_path = "".join(list)
    if (find_src_file_path != ''):
        # 将Windows文件路径的'\'改为Linux路径的'/'
        find_src_file_path = re.sub(r'\\', "/", find_src_file_path)
        # print ("原始src文件位置：" + find_src_file_path)

        # 删除所有的多级目录 '../'
        copy_src_file_path = re.sub(r"\.\./", "", find_src_file_path)
        # print ("拷贝的src文件：" + copy_src_file_path)

        # 得到文件夹路径
        copy_src_file_dir = re.sub(r'[^/]*\..', '', copy_src_file_path)
        # print ("src目录：" + copy_src_file_dir)

        # 创建文件夹并拷贝
        mkdir(dir + copy_src_file_dir)
        copy_file(find_src_file_path, dir + copy_src_file_path)

        # 删除所有的多级目录 '../'
        line = re.sub(r"\.\.\\", "", line)
        # 添加上一层的相对路径
        line = re.sub(r"<FilePath>", '<FilePath>..\\\\', line)
        return line
    else:
        return line

def replace_inc_file_path(line, dir = project_dir):
    find_inc_file_path = ''
    copy_inc_file_path = ''
    copy_inc_file_dir = ''
    replace_inc_file_path_tmp = ''
    # 找到文件路径
    list = re.findall(r"<IncludePath>(.+?)</IncludePath>", line)
    find_all_inc_file_path = "".join(list)
    if (find_all_inc_file_path != ''):
        # 将Windows文件路径的'\'改为Linux路径的'/'
        find_all_inc_file_path = re.sub(r'\\', "/", find_all_inc_file_path)
        # print ("原始inc文件位置：" + find_all_inc_file_path)

        # 做成list
        inc_list = find_all_inc_file_path.split(";")
        # print(inc_list)

        for item in inc_list:

            find_inc_file_path = item
            # print ("原始inc文件位置：" + find_inc_file_path)

            # 删除所有的多级目录 '../'
            copy_inc_file_path = re.sub(r"\.\./", "", find_inc_file_path)
            # print ("拷贝的inc文件：" + copy_inc_file_path)

            # 为头文件路径添加相对目录
            tmp_path = re.sub(r"^", '../', copy_inc_file_path)
            tmp_path += ';'
            replace_inc_file_path_tmp += tmp_path
            # print ("inc文件相对路径：" + replace_inc_file_path)

            # 拷贝并支持覆盖
            copy_and_overwrite(find_inc_file_path, dir + copy_inc_file_path)

        # 删除字符串最后一个分号';'
        replace_inc_file_path_tmp = replace_inc_file_path_tmp[:-1]

        # 将Linux路径的'/'改为Windows文件路径的'\'
        replace_inc_file_path_tmp = re.sub(r'/', "\\\\", replace_inc_file_path_tmp)

        # 组合生成路径
        replace_inc_file_path_tmp = "<IncludePath>" + replace_inc_file_path_tmp + "</IncludePath>" + "\n"
        # print ("最终结果：" + replace_inc_file_path_tmp)

        return replace_inc_file_path_tmp
    else:
        return line

def main(file = project_file, dir = project_dir):
    
    mkdir(dir + project_dir)

    src_file = open(file, 'r')
    dst_file = open(dir + project_dir + file,'w')

    line = src_file.readline()
    while line:
        line = replace_src_file_path(line, dir)
        line = replace_inc_file_path(line, dir)

        dst_file.writelines(line)

        line = src_file.readline()
        

    src_file.close()
    dst_file.close()


if __name__ == "__main__":
    file = project_file
    dir = project_dir

    len = len(sys.argv)
    if (len == 2):
        file = sys.argv[1]
    elif (len == 3):
        file = sys.argv[1]
        dir = sys.argv[2]

    main(file, dir)



