public class SampleController implements IComponentProvider
{
    public ApexPages.Component provideComponent() 
    {
        return new Component.c.Sample();
    }
}