import argparse
import os
import stat

def distribute(output_dir,cmd_line):
   if cmd_line is None:
      print('cmd_line is None')
   else:
      print('cmd_line:'+str(type(cmd_line))) 
      print(len(cmd_line))
      for i,line in enumerate(cmd_line):
          print('cmd line is: '+str(line))
          filename = 'cmd'+str(i+1)+'.txt'
          fileOutput_path = os.path.join(output_dir,filename)
          print('output filename is: '+fileOutput_path)
          f = open(fileOutput_path,'w')
          f.write(str(line))
          f.close()
          os.chmod(fileOutput_path,stat.S_IRWXU|stat.S_IRGRP|stat.S_IROTH)
          with open('/FilePath'+str(i+1)+'.txt','w+') as f:
                 f.write(fileOutput_path)
          print('filePath is: '+'/FilePath'+str(i+1)+'.txt')

def parse_arguments():
    """Parse command line arguments."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--cmdLine',action='append',type=str,default=None,required=False,help='cmd line to be input')
    parser.add_argument('--output_dir',type=str,required=True,help='local file to be output')
    args = parser.parse_args()
    return args

def main():
    args = parse_arguments()
    distribute(args.output_dir,args.cmdLine)

if __name__ == '__main__':
    main()
